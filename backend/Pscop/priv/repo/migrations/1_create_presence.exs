defmodule Pscop.Persistence.Repo.Migrations.CreatePresence do
  use Ecto.Migration

  def change do
    create table(:presence) do
      add :arrival_date, :naive_datetime
      add :departure_date, :naive_datetime
      add :motif, :string

      timestamps(type: :utc_datetime)
    end
  end
end
