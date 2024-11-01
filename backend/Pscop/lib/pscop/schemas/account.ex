defmodule Pscop.Schemas.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @email_regex ~r/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  @password_regex ~r/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])/

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
    |> validate_format(:email, @email_regex, message: "must be a valid email address")
    |> unique_constraint(:email)
    |> validate_length(:password, min: 8, message: "password must be at least 8 characters long")
    |> validate_password_format(:password)
    |> hash_password()
  end

  defp validate_password_format(changeset, field) do
    password = get_field(changeset, field)

    if password && !valid_password?(password) do
      add_error(changeset, field, "password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character")
    else
      changeset
    end
  end

  defp valid_password?(password) do
    Regex.match?(@password_regex, password)
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
