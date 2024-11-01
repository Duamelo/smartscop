defmodule Pscop.Persistence.Repo.Migrations.CreateRole do
  use Ecto.Migration

  def change do
    create table(:role) do
      add :label, :string
      add :permissions, :map
      add :tag, :string

      timestamps(type: :utc_datetime)
    end
    create unique_index(:role, [:label])
  end
end
