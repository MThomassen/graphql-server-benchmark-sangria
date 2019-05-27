lazy val data_sql = (project in file("."))
  .settings(
    name := "GraphQL Server Benchmark Sangria",
    organization := "io.github.mthomassen",
    scalaVersion := "2.12.8",
    version := "1.0.0",
    libraryDependencies ++= Seq(
      "org.sangria-graphql" %% "sangria" % "1.4.2",
      "org.sangria-graphql" %% "sangria-circe" % "1.2.1",
      "com.typesafe.akka" %% "akka-actor" % "2.5.23",
      "com.typesafe.akka" %% "akka-stream" % "2.5.23",
      "com.typesafe.akka" %% "akka-http" % "10.1.8",
      "de.heikoseeberger" %% "akka-http-circe" % "1.25.2",
      "com.typesafe.akka" %% "akka-slf4j" % "2.5.23",
      "io.circe" %% "circe-core" % "0.11.1",
      "io.circe" %% "circe-generic" % "0.11.1",
      "io.circe" %% "circe-generic-extras" % "0.11.1",
      "org.slf4j" % "slf4j-api" % "1.7.25",
      "ch.qos.logback" % "logback-classic" % "1.2.3",
      "com.typesafe.akka" %% "akka-testkit" % "2.5.23" % Test,
      "org.scalatest" %% "scalatest" % "3.0.7" % Test
    )
  )
