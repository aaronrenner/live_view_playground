# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_one_four,
  ecto_repos: [PhoenixOneFour.Repo]

# Configures the endpoint
config :phoenix_one_four, PhoenixOneFourWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IrNdm9qoRCtbNqv/YNMrsW7+gqh7d7hP+I6CdpW1O8VG2c3oifaGbXiKkag2P4BA",
  render_errors: [view: PhoenixOneFourWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixOneFour.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
