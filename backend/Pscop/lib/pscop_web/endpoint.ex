defmodule PscopWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :pscop

  @session_options [
    store: :cookie,
    key: "_pscop_key",
    signing_salt: "ak3xsvDK",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

    plug Plug.Static,
    at: "/",
    from: :pscop,
    gzip: false,
    only: PscopWeb.static_paths()

  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :pscop
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug PscopWeb.Router
end
