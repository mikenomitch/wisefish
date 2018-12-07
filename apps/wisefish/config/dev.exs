use Mix.Config

# Configure your database
config :wisefish, Wisefish.Repo,
  database: "wisefish_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool_size: 10
