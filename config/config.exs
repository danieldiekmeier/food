# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :food,
  ecto_repos: [Food.Repo]

# Configures the endpoint
config :food, FoodWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kkWJ6ItYypsnxfJpl5uxaes9ftLFUHs/wCNt8EA1ZqF+9N5sYh1XaMe50EX5Iyke",
  render_errors: [view: FoodWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Food.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
