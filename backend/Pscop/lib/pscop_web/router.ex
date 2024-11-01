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

    post    "/presences", PresenceController, :enregistrer_nouvelle_presence
    # get     "/presences", PresenceController, :obtenir_liste_presence
    # get     "/presences/:usager_id", PresenceController, :consulter_presence_par_usager
    # put     "/presences/:usager_id", PresenceController, :mettre_a_jour_info_presence
    # delete  "/presences/:usager_id", PresenceController, :supprimer_presence

    post    "/users", UserController, :enregistrer_nouveau_user
    get     "/users", UserController, :obtenir_liste_users
    get     "/users/:user_id", UserController, :consulter_info_user
    put     "/users/:user_id", UserController, :mettre_a_jour_info_user
    delete  "/users/:user_id", UserController, :supprimer_user

    # put   "/devenir_membre/usagers/:usager_id", UsagerController, :devenir_membre
  end
end
