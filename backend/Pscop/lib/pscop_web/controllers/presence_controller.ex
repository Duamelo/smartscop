defmodule PscopWeb.PresenceController do
  use PscopWeb, :controller

  alias Pscop.Services.Presences
  alias Pscop.Schemas.Presence

  action_fallback PscopWeb.FallbackController

  def get_all_presences(conn, _params) do
    presence = Presences.list_presence()
    render(conn, :get_all_presences, presence: presence)
  end

  def enregistrer_nouvelle_presence(conn, %{"arrival_date" => arrival_date, "motif" => motif, "user_id"=> user_id}) do
    with {:ok, %Presence{} = presence} <- Presences.create_presence(%{"arrival_date" => arrival_date, "motif" => motif, "user_id"=> user_id}) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/presences/#{presence}")
      |> render(:show, presence: presence)
    end
  end

  def show(conn, %{"id" => id}) do
    presence = Presences.get_presence!(id)
    render(conn, :show, presence: presence)
  end

  def update(conn, %{"id" => id, "presence" => presence_params}) do
    presence = Presences.get_presence!(id)

    with {:ok, %Presence{} = presence} <- Presences.update_presence(presence, presence_params) do
      render(conn, :show, presence: presence)
    end
  end

  def delete(conn, %{"id" => id}) do
    presence = Presences.get_presence!(id)

    with {:ok, %Presence{}} <- Presences.delete_presence(presence) do
      send_resp(conn, :no_content, "")
    end
  end
end
