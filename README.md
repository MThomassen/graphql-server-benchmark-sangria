GraphQL Server
---

GraphQL Benchmark Server implemented with [`Scala`](https://scala-lang.org/)'s frameworks [`Akka`](https://akka.io/) and [`Sangria`](https://sangria-graphql.org/)


![GraphQL Schema](schema.png?raw=true "Schema")

### Starting the application (development)
To start the Akka HTTP application:

  * Start RDBMS and Author Service with `docker-compose up`
  * Start GraphQL application with `sbt run`

Now you can visit the [`GraphiQL Web Application`](http://localhost:8080/api/graphiql) from your browser.

### Query example

```bash
GRAPHQL_QUERY_PAYLOAD=$(echo '{
  "query": "query AuthorsPostWithFullComments($authorId: Int) {
              allPosts(authorId: $authorId) {
                title
                content
                comments {
                  content
                  author {
                    firstname
                    lastname
                  }
                }
              }
            }",
  "variables": {
    "authorId": 1
  },
  "operationName": "AuthorsPostWithFullComments"
}' \
| tr -d '\n\r' \
| jq -c '.')

curl \
  -H "Accept: application/json" \
  -H "content-type: application/json" \
  --data "${GRAPHQL_QUERY_PAYLOAD}" \
  "http://localhost:8080/api"
```
