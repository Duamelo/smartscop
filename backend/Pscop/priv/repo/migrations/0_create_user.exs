defmodule Pscop.Persistence.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nom, :string
      add :prenoms, :string
      add :telephone, :string
      add :status, :string
      add :email, :string
      add :sexe, :string
      add :profession, :string
      add :pin, :string
      add :handicap, :string

      timestamps(type: :utc_datetime)
    end
  end
end
