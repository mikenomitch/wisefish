# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wisefish_web,
  namespace: WisefishWeb,
  ecto_repos: [Wisefish.Repo]

# Configures the endpoint
config :wisefish_web, WisefishWeb.Endpoint,
  url: [host: {:system, "HOST"}],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: WisefishWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WisefishWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :wisefish_web, :generators, context_app: :wisefish

config :wisefish_web, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: WisefishWeb.Router
    ]
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
