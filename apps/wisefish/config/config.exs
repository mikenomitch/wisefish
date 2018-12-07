use Mix.Config

# General application configuration
config :wisefish,
  ecto_repos: [Wisefish.Repo]

config :wisefish, Wisefish.Accounts.Authentication,
  issuer: "wisefish",
  secret_key: System.get_env("SECRET_KEY_BASE")

config :ueberauth, Ueberauth,
  providers: [
    identity: {Ueberauth.Strategy.Identity, [callback_methods: ["POST"]]}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
