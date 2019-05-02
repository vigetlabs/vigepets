# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vigepets,
  ecto_repos: [Vigepets.Repo]

# Configures the endpoint
config :vigepets, VigepetsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Xbdi+PM74nbRh0fYM+pOPuj2rZGjOibKzjt3uLcSJU03r3lFnrqL1wNSdmJKGvQ5",
  render_errors: [view: VigepetsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Vigepets.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
