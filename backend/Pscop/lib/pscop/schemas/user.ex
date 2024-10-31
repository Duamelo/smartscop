defmodule Pscop.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :nom, :string
    field :prenoms, :string
    field :status, :string
    field :telephone, :string
    field :email, :string
    field :sexe, :string
    field :profession, :string
    field :handicap, :string
    field :pin, :string

    timestamps(type: :utc_datetime)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nom, :prenoms, :telephone, :status, :email, :sexe, :profession, :pin, :handicap])
    |> validate_required([:nom, :prenoms])
  end
end
