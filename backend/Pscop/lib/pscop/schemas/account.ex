defmodule Pscop.Schemas.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :password_hash, :string
    field :email, :string
    field :is_active, :boolean, default: false
    field :tag, :string

    field :password, :string, virtual: true

    belongs_to :role, Pscop.Schemas.Role

    timestamps(type: :utc_datetime)
  end

  def changeset(account, attrs) do
    account
    |> cast(attrs, [:email, :password, :is_active, :role_id])
    |> validate_required([:email, :password, :role_id])
    |> validate_format(:email, ~r/[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> unique_constraint(:email)
    |> hash_password()
  end

  defp hash_password(changeset) do
    if changeset.valid? do
      password = get_change(changeset, :password)
      changeset
      |> put_change(:password_hash, Bcrypt.hash_pwd_salt(password))
      |> delete_change(:password)
    else
      changeset
    end
  end
end
