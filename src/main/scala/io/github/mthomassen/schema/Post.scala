package io.github.mthomassen.schema

case class Post(id: Int, title: String, content: String)

object Post {
  import io.circe.{Decoder, Encoder}
  import io.circe.generic.semiauto._

  implicit val postDecoder: Decoder[Post] = deriveDecoder[Post]
  implicit val postEncoder: Encoder[Post] = deriveEncoder[Post]
}
