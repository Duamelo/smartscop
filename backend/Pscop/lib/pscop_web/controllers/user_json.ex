defmodule PscopWeb.UserJSON do
  alias Pscop.Schemas.User

  def index(%{user: user}) do
    %{data: for(user <- user, do: data(user))}
  end

  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      nom: user.nom,
      prenoms: user.prenoms,
      telephone: user.telephone,
      status: user.status,
      email: user.email,
      age: user.age,
      sexe: user.sexe,
      profil: user.profil,
      pin: user.pin,
      handicap: user.handicap
    }
  end
end
