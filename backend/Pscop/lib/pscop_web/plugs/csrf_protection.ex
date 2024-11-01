defmodule PscopWeb.Plugs.CSRFProtection do
  import Plug.Conn
  import Phoenix.Controller, only: [json: 2]

  alias Pscop.Services.AuthToken

  def init(opts), do: opts

  def call(conn, _opts) do
    conn = fetch_cookies(conn)
    case conn.cookies["jwt"] do
      nil ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Authentication required"})
        |> halt()

      jwt ->
        case AuthToken.verify_token(jwt) do
          {:ok, claims} ->
            csrf_token_from_jwt = claims["claims"]["xsrf-token"]
            csrf_token_from_request = get_req_header(conn, "x-xsrf-token") |> List.first()

            if AuthToken.validate_xsrf_token(csrf_token_from_jwt, csrf_token_from_request) do
              conn
              |> assign(:current_user_id, claims["claims"]["user_id"])
              |> assign(:current_user_role, claims["claims"]["role"])
            else
              conn
              |> put_status(:forbidden)
              |> json(%{error: "Invalid CSRF token"})
              |> halt()
            end

          {:error, _reason} ->
            conn
            |> put_status(:unauthorized)
            |> json(%{error: "Invalid JWT"})
            |> halt()
        end
    end
  end
end
