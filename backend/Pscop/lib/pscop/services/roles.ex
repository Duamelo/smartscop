defmodule Pscop.Services.Roles do

  import Ecto.Query, warn: false
  alias Pscop.Persistence.Repo

  alias Pscop.Schemas.Role

  def list_role do
    Repo.all(Role)
  end

  def get_role!(id), do: Repo.get!(Role, id)

  def get_role_by_label!(label) do
    from(u in Role,
      where: u.label == ^label
    )
    |> Repo.one()
  end

  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  def change_role(%Role{} = role, attrs \\ %{}) do
    Role.changeset(role, attrs)
  end
end
