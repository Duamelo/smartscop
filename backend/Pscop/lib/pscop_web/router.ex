defmodule PscopWeb.Router do
  use PscopWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug :accepts, ["json"]
    plug PscopWeb.Plugs.CSRFProtection
  end

  scope "/api", PscopWeb do
    pipe_through :api

    post    "/users", UserController, :register_new_visitor
    get     "/users", UserController, :get_all_users
    get     "/users/:user_id", UserController, :get_info_user
    put     "/users/:user_id", UserController, :mettre_a_jour_info_user
    delete  "/users/:user_id", UserController, :supprimer_user

    delete "/auth/sign_out", AuthController, :sign_out
  end

  scope "/api", PscopWeb do
    pipe_through :api

    post "/account/sign_up", AuthController, :sign_up

    post "/auth/sign_in", AuthController, :sign_in
  end
end
