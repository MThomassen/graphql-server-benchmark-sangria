package io.github.mthomassen.schema

case class Author(id: Int, firstname: Option[String], lastname: String)

object Author {
  import io.circe.{Decoder, Encoder}
  import io.circe.generic.semiauto._

  implicit val authorDecoder: Decoder[Author] = deriveDecoder[Author]
  implicit val authorEncoder: Encoder[Author] = deriveEncoder[Author]
}
