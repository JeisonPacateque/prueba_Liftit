# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :prueba_Liftit,
  ecto_repos: [Prueba_Liftit.Repo]

# Configures the endpoint
config :prueba_Liftit, Prueba_LiftitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bQaCDewd06qzbMluom6fuCK1fhGhrqZ8E2+lBrj3XiAlDC2t7w+fGzH3/7LhKO8j",
  render_errors: [view: Prueba_LiftitWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Prueba_Liftit.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
