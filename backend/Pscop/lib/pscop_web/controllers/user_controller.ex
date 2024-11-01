defmodule PscopWeb.UserController do
  use PscopWeb, :controller

  alias Pscop.Services.Users
  alias Pscop.Schemas.User

  action_fallback PscopWeb.FallbackController

  plug(PscopWeb.Plugs.CheckPermissions,
  actions: [
    enregistrer_nouveau_user: {"users", "create"},
    ]
  )

  def get_all_users(conn, _params) do
    users = Users.get_users()
    render(conn, :index, user: users)
  end

  def register_new_visitor(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.register_visitor(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/users/#{user}")
      |> render(:show, user: user)
    end
  end

  def consulter_info_user(conn, %{"user_id" => id}) do
    user = Users.get_user!(id)
    render(conn, :show, user: user)
  end

  def mettre_a_jour_info_user(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    with {:ok, %User{} = user} <- Users.update_user(user, user_params) do
      render(conn, :show, user: user)
    end
  end

  def supprimer_user(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
