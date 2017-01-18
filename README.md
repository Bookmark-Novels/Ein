# Ein

Bookmark's dependency usage bookeeper and notifier.

Ein keeps track of who's using what and notifies others when there may be any dependency conflicts (e.g. somebody changes a chapter title while you're editing the table of contents). Ein is also responsible for invalidating cached objects in redis as well as newly invalidated pages in Varnish.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ein` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ein, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ein](https://hexdocs.pm/ein).

