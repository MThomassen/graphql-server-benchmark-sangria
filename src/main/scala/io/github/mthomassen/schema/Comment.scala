package io.github.mthomassen.schema

case class Comment(id: Int, content: String)

object Comment {
  import io.circe.{Decoder, Encoder}
  import io.circe.generic.semiauto._

  implicit val commentDecoder: Decoder[Comment] = deriveDecoder[Comment]
  implicit val commentEncoder: Encoder[Comment] = deriveEncoder[Comment]
}
