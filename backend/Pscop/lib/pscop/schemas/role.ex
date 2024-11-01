defmodule Pscop.Schemas.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "role" do
    field :label, :string
    field :permissions, :map
    field :tag, :string

    has_one :accounts, Pscop.Schemas.Account

    timestamps(type: :utc_datetime)
  end

  def changeset(role, attrs) do
    role
    |> cast(attrs, [:label, :permissions, :tag])
    |> validate_required([:label, :permissions])
    |> unique_constraint(:label)
    |> validate_at_least_one_permission()
    |> Pscop.Permissions.validate_permissions(:permissions)
  end

  defp validate_at_least_one_permission(changeset) do
    validate_change(changeset, :permissions, fn field, permissions ->
      if map_size(permissions) == 0 do
        [{field, "The role must have at least one permission"}]
      else
        []
      end
    end)
  end
end
