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

    post    "/users", UserController, :enregistrer_nouveau_user
    get     "/users", UserController, :obtenir_liste_users
    get     "/users/:user_id", UserController, :consulter_info_user
    put     "/users/:user_id", UserController, :mettre_a_jour_info_user
    delete  "/users/:user_id", UserController, :supprimer_user

    # put   "/devenir_membre/usagers/:usager_id", UsagerController, :devenir_membre
    delete "/auth/sign_out", AuthController, :sign_out
  end

  scope "/api", PscopWeb do
    pipe_through :api

    post "/account/sign_up", AuthController, :sign_up

    post "/auth/sign_in", AuthController, :sign_in
  end
end
