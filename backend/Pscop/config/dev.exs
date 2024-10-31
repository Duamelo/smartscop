import Config

config :pscop, Pscop.Persistence.Repo,
  username: "postgres",
  password: "root",
  hostname: "localhost",
  database: "pscopdb",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :pscop, PscopWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  https: [
  port: 4001,
  cipher_suite: :strong,
  keyfile: "priv/cert/selfsigned_key.pem",
  certfile: "priv/cert/selfsigned.pem"
  ],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "3XrlLBNltgle18Wv2aXqhaOMdVbkA5dXGhZ3ggnA8g5KL6WGLGzLOgq6fpAnrUB2",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:pscop, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:pscop, ~w(--watch)]}
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :swoosh, :api_client, false
