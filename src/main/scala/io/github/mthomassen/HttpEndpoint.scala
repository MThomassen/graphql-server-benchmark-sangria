package io.github.mthomassen

import akka.actor.ActorSystem
import akka.event.{Logging, LoggingAdapter}
import akka.http.scaladsl.Http
import akka.http.scaladsl.Http.ServerBinding
import akka.http.scaladsl.model.StatusCodes
import akka.http.scaladsl.server.{Directives, Route}
import akka.stream.{ActorMaterializer, Materializer}
import io.circe.Json
import sangria.ast.Document
import sangria.parser.QueryParser

import scala.concurrent.Future
import scala.util.{Failure, Success}

class HttpEndpoint(interface: String, port: Int)(
    implicit val system: ActorSystem
) extends Directives {
  private[this] val log: LoggingAdapter = Logging(system, getClass)
  private[this] implicit val materializer: Materializer = ActorMaterializer()

  val route: Route = Route.seal(
    get {
      getFromResourceDirectory("www/assets")
    } ~
    pathPrefix("api") {
      pathPrefix("graphiql") {
        pathEndOrSingleSlash {
          getFromResource("www/graphiql.html")
        }
      } ~
      optionalHeaderValueByName("X-Apollo-Tracing") { tracing =>
//        post {
//          parameters('query.?, 'operationName.?, 'variables.?) { (queryParam, operationNameParam, variablesParam) =>
//            entity(as[Json]) { body ⇒
//              val query = queryParam orElse root.query.string.getOption(body)
//              val operationName = operationNameParam orElse root.operationName.string.getOption(body)
//              val variablesStr = variablesParam orElse root.variables.string.getOption(body)
//
//              query.map(QueryParser.parse(_)) match {
//                case Some(Success(ast)) =>
//                  variablesStr.map(parse) match {
//                    case Some(Left(error)) => complete(StatusCodes.BadRequest, formatError(error))
//                    case Some(Right(json)) => executeGraphQL(ast, operationName, json, tracing.isDefined)
//                    case None ⇒ executeGraphQL(ast, operationName, root.variables.json.getOption(body) getOrElse Json.obj(), tracing.isDefined)
//                  }
//                case Some(Failure(error)) => complete(StatusCodes.BadRequest, formatError(error))
//                case None ⇒ complete(StatusCodes.BadRequest, formatError("No query to execute"))
//              }
//            }
//            complete(StatusCodes.OK)
//          }
//        }
        complete(StatusCodes.OK)
      }
    }
  )

  /**
    * Starts the Web Server
    *
    * @return Binding
    */
  def bind(): Future[ServerBinding] = {
    log.info(s"Binding Endpoint on {}:{} ..", interface, port)

    Http().bindAndHandle(handler = route, interface = interface, port = port)
  }
}
