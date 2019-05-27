package io.github.mthomassen

import akka.actor.ActorSystem
import akka.event.{Logging, LoggingAdapter}
import akka.http.scaladsl.Http
import akka.http.scaladsl.Http.ServerBinding
import akka.http.scaladsl.server.{Directives, Route}
import akka.stream.{ActorMaterializer, Materializer}

import scala.concurrent.Future

class HttpEndpoint(interface: String, port: Int)(implicit val system: ActorSystem) extends Directives {
  private[this] val log: LoggingAdapter = Logging(system, getClass)
  private[this] implicit val materializer: Materializer = ActorMaterializer()


  val route: Route = Route.seal(pathPrefix("api") {
    pathPrefix("graphiql") {
      pathEndOrSingleSlash {
        getFromResource("graphiql.html")
      }
    }
  })

  /**
    * Starts the Web Server
    * @return Binding
    */
  def bind(): Future[ServerBinding] = {
    log.info(s"Binding Endpoint on {}:{} ..", interface, port)

    Http().bindAndHandle(
      handler = route,
      interface = interface,
      port = port)
  }
}
