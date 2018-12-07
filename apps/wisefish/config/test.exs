use Mix.Config

# Configure your database
config :wisefish, Wisefish.Repo,
  username: "postgres",
  password: "postgres",
  database: "wisefish_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Same passwords in tests
config :pbkdf2_elixir, rounds: 1
