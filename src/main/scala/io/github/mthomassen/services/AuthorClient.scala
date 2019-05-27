package io.github.mthomassen.services

import akka.actor.ActorSystem
import akka.event.{Logging, LoggingAdapter}
import akka.http.scaladsl.Http
import akka.http.scaladsl.model.Uri.Path
import akka.http.scaladsl.model._
import akka.http.scaladsl.model.headers.Accept
import akka.http.scaladsl.unmarshalling.Unmarshal
import akka.http.scaladsl.util.FastFuture
import akka.stream.{ActorMaterializer, Materializer}
import akka.util.ByteString
import io.github.mthomassen.schema.Author

import scala.collection.immutable
import scala.concurrent.Future

class AuthorClient()(implicit system: ActorSystem) {
  private[this] val log: LoggingAdapter = Logging(system, getClass)
  private[this] implicit val materializer: Materializer = ActorMaterializer()

  import de.heikoseeberger.akkahttpcirce.FailFastCirceSupport._
  import system.dispatcher

  def find(authorId: Int): Future[Option[Author]] = {
    val request = HttpRequest(
      method = HttpMethods.GET,
      uri = Uri("http://localhost:8081")
        .withPath(Path("/authors") / authorId.toString),
      headers = immutable.Seq(Accept(MediaTypes.`application/json`))
    )

    Http()
      .singleRequest(request)
      .flatMap {
        case HttpResponse(StatusCodes.OK, _, entity, _) =>
          Unmarshal(entity).to[Author].map(Some(_))

        case HttpResponse(StatusCodes.NotFound, _, entity, _) =>
          entity.discardBytes().future().map(_ => None)

        case HttpResponse(_, _, entity, _) =>
          entity.dataBytes
            .runFold(ByteString.empty)(_ ++ _)
            .flatMap(e => FastFuture.failed(new RuntimeException(e.utf8String)))
      }
  }
}
