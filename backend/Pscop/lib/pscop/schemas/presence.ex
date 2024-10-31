defmodule Pscop.Schemas.Presence do
  use Ecto.Schema
  import Ecto.Changeset

  schema "presence" do
    field :arrival_date, :naive_datetime
    field :departure_date, :naive_datetime
    field :motif, :string

    belongs_to :User, Pscop.Schemas.User
    timestamps(type: :utc_datetime)
  end

  def changeset(presence, attrs) do
    presence
    |> cast(attrs, [:departure_date, :arrival_date, :motif, :user_id])
    |> validate_required([:user_id, :motif, :arrival_date])
  end
end
