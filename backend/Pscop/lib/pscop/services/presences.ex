defmodule Pscop.Services.Presences do

  import Ecto.Query, warn: false
  alias Pscop.Persistence.Repo

  alias Pscop.Schemas.Presence

  def list_presence do
    Repo.all(Presence)
  end

  def get_presence!(id), do: Repo.get!(Presence, id)

  def create_presence(attrs \\ %{}) do
    %Presence{}
    |> Presence.changeset(attrs)
    |> Repo.insert()
  end

  def update_presence(%Presence{} = presence, attrs) do
    presence
    |> Presence.changeset(attrs)
    |> Repo.update()
  end

  def delete_presence(%Presence{} = presence) do
    Repo.delete(presence)
  end

  def change_presence(%Presence{} = presence, attrs \\ %{}) do
    Presence.changeset(presence, attrs)
  end
end
