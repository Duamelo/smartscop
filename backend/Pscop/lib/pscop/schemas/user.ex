defmodule Pscop.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  @email_regex ~r/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/

  @allowed_sexes ["Masculin", "Feminin", "Autre"]

  schema "users" do
    field :nom, :string
    field :prenoms, :string
    field :status, :string
    field :telephone, :integer
    field :email, :string
    field :sexe, :string
    field :profil, :string
    field :handicap, :string
    field :pin, :string

    timestamps(type: :utc_datetime)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nom, :prenoms, :telephone, :status, :email, :sexe, :profession, :pin, :handicap])
    |> validate_required([:nom, :prenoms, :telephone])
    |> validate_format(:email, @email_regex, message: "must be a valid email address")
    |> validate_inclusion(:sexe, @allowed_sexes)
  end
end
