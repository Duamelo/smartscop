defmodule Pscop.Persistence.Repo.Migrations.AddUserIdToPresence do
  use Ecto.Migration

  def change do
    alter table(:presence) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    create index(:presence, [:user_id])
  end
end
