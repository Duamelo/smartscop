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
    get     "/users/:user_id", UserController, :get_user_info
    put     "/users/:id", UserController, :update_user_info
    delete  "/users/:user_id", UserController, :supprimer_user

    delete "/auth/sign_out", AuthController, :sign_out
  end

  scope "/api", PscopWeb do
    pipe_through :api

    post "/account/sign_up", AuthController, :sign_up

    post "/auth/sign_in", AuthController, :sign_in
  end
end
