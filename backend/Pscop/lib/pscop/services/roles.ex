defmodule Pscop.Services.Roles do

  import Ecto.Query, warn: false
  alias Pscop.Persistence.Repo

  alias Pscop.Schemas.Role

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
end
