import Config

config :pscop,
  namespace: Pscop,
  ecto_repos: [Pscop.Persistence.Repo],
  generators: [timestamp_type: :utc_datetime]

config :pscop, PscopWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: PscopWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Pscop.PubSub,
  live_view: [signing_salt: "Jjq1zjuE"]

config :pscop, Pscop.Mailer, adapter: Swoosh.Adapters.Local

config :esbuild,
  version: "0.17.11",
  pscop: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.3",
  pscop: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
