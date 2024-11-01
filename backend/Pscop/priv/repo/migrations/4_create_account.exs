defmodule Pscop.Persistence.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :email, :string
      add :password, :string, null: false
      add :is_active, :boolean, default: false, null: false
      add :tag, :string
      add :role_id, references(:role)

      timestamps(type: :utc_datetime)
    end
    create unique_index(:accounts, [:email])
    create unique_index(:accounts, [:role_id])
  end
end
