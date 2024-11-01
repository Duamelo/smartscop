defmodule PscopWeb.PresenceJSON do
  alias Pscop.Schemas.Presence

  def get_all_presences(%{presence: presences}) do
    %{data: for(presence <- presences, do: data(presence))}
  end

  def show(%{presence: presence}) do
    %{data: data(presence)}
  end

  defp data(%Presence{} = presence) do
    %{
      id: presence.id,
      arrival_date: presence.arrival_date,
      departure_date: presence.departure_date,
      motif: presence.motif
    }
  end
end
