defmodule Pscop.Schemas.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @email_regex ~r/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  @password_regex ~r/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])/
  @min_length_password 8

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
    |> validate_password_format()
    |> hash_password()
  end

  defp validate_password_format(changeset) do
    password = get_field(changeset, :password)

    cond do
      !valid_password?(password) ->
        add_error(changeset, :password, "password must be at least 8 characters long, contain one uppercase letter, one lowercase letter, one digit, and one special character")
        raise("password must be at least 8 characters long, contain one uppercase letter, one lowercase letter, one digit, and one special character")
      true ->
        changeset
    end
  end

  defp valid_password?(password) do
    Regex.match?(@password_regex, password) && String.length(password) >= @min_length_password
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
