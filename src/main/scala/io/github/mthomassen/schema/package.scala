package io.github.mthomassen

import sangria.schema._

package object schema {
  val AuthorType = ObjectType(
    "author",
    "The Author of a Post or Comment",

    fields[Unit, Author](
      Field("id", IntType, resolve = _.value.id),
      Field("firstname", OptionType(StringType), resolve = _.value.firstname),
      Field("lastname", StringType, resolve = _.value.lastname)
    ))

  val CommentType = ObjectType(
    "comment",
    "Comment",

    fields[Unit, Comment](
      Field("id", IntType, resolve = _.value.id),
      Field("content", OptionType(StringType), resolve = _.value.content)
    ))

  val PostType = ObjectType(
    "post",
    "Post",

    fields[Unit, Post](
      Field("id", IntType, resolve = _.value.id),
      Field("title", StringType, resolve = _.value.title),
      Field("content", OptionType(StringType), resolve = _.value.content)
    ))
}
