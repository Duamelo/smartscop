defmodule Pscop.Persistence.Repo.Migrations.CreatePresence do
  use Ecto.Migration

  def change do
    create table(:presence) do
      add :arrival_date, :naive_datetime
      add :departure_date, :naive_datetime
      add :motif, :string

      # add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    # create index(:presence, [:user_id])
  end
end
