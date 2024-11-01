defmodule PscopWeb.AuthController do
  use PscopWeb, :controller

  alias Pscop.Services.Accounts
  alias Pscop.Services.Roles
  alias Pscop.Services.AuthToken

  def sign_up(conn, %{"email" => email, "password" => password, "role" => role_label}) do
    try do
      role = Roles.get_role_by_label!(role_label)
      case Accounts.create_account(%{email: email, password: password, role_id: role.id}) do
        {:ok, account} ->
          conn
          |> put_status(:created)
          |> json(%{id: account.id, message: "account created successfully"})
        {:error, reason} ->
          conn
          |> put_status(:bad_request)
          |> json(%{error: reason})
      end
    rescue
      e in RuntimeError ->
        conn
        |> put_status(400)
        |> json(%{error: e.message})
      Ecto.ConstraintError ->
        conn
        |> put_status(404)
        |> render("error.json", error: "This email is already taken")
    end
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_account(email, password) do
      {:ok, account} ->
        xsrf_token = AuthToken.get_xsrf_token()
      {:ok, jwt} = AuthToken.generate_token(account, xsrf_token)
        conn
        |> put_resp_cookie("jwt", jwt, http_only: true)
        |> json(%{
          "xsrf-token" => xsrf_token,
          "id" => account.id,
          "role" => account.role_id
        })
      _ ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid credentials"})
    end
  end

  def sign_out(conn, _params) do
    conn
    |> delete_resp_cookie("jwt")
    |> json(%{message: "Signed out successfully"})
  end
end
