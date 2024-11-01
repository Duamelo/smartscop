defmodule Pscop.Persistence.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nom, :string, null: false
      add :prenoms, :string, null: false
      add :telephone, :string
      add :status, :string
      add :email, :string
      add :sexe, :string
      add :profil, :string
      add :pin, :string
      add :handicap, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:email])
  end
end
