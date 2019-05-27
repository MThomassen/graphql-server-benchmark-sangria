package io.github.mthomassen

import akka.actor.ActorSystem
import akka.event.{Logging, LoggingAdapter}
import io.github.mthomassen.services.AuthorClient

import scala.concurrent.Await
import scala.concurrent.duration.Duration

object GraphQLServerApplication extends App {
  private[this] implicit val system: ActorSystem = ActorSystem("graphql-server")
  private[this] val log: LoggingAdapter = Logging(system, getClass)

  log.info("Application starting..")

  val endpoint = new HttpEndpoint("localhost", 8080)
      .bind()

  new AuthorClient().find(1)
      .foreach(println)(system.dispatcher)

  Await.result(system.whenTerminated, Duration.Inf)

  log.info("Application stopped")
}
