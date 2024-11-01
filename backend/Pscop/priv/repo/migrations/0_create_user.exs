defmodule Pscop.Persistence.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nom, :string, null: false
      add :prenoms, :string, null: false
      add :telephone, :string, null: false
      add :status, :string, default: "visiteur", null: false
      add :email, :string
      add :age, :string
      add :sexe, :string
      add :profil, :string
      add :pin, :string
      add :handicap, :string

      timestamps(type: :utc_datetime)
    end

  end
end
