import Config

config :pscop, Pscop.Persistence.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "pscop_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

config :pscop, PscopWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "70pNsXeuljZ7v6z0RMJdoO6umOxSx98ZIZFOZinPzTmi/uZymUVW337lPWdVHc/J",
  server: false

config :pscop, Pscop.Mailer, adapter: Swoosh.Adapters.Test

config :swoosh, :api_client, false

config :logger, level: :warning

config :phoenix, :plug_init_mode, :runtime
