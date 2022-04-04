# DoistApps

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Run some queries:

```sh
$ curl http://localhost:4000/api/apps
{
  "data": [
    {
      "description": "A test app",
      "id": 1,
      "name": "Test",
      "redirect_uri": "https://example.com/oauth",
      "user_id": "1"
    },
    {
      "description": "A demo app",
      "id": 2,
      "name": "Demo",
      "redirect_uri": "https://example.org/oauth",
      "user_id": "2"
    }
  ]
}

$ curl -X POST http://localhost:4000/api/apps -H "Content-Type: application/json" -d '{"app":{"user_id":"1","name":"Example","description":"An example app","redirect_uri":"https://example.com/oauth"}}'
{
  "data": {
    "description": "An example app",
    "id": 9,
    "name": "Example",
    "redirect_uri": "https://example.com/oauth",
    "user_id": "1"
  }
}

$ curl -X PATCH http://localhost:4000/api/apps/3 -H "Content-Type: application/json" -d '{"app":{"name":"Sample"}}'
{
  "data": {
    "description": "An example app",
    "id": 3,
    "name": "Sample",
    "redirect_uri": "https://example.com/oauth",
    "user_id": "1"
  }
}

$ curl -X DELETE http://localhost:4000/api/apps/3 -H "Content-Type: application/json"
$

```

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
