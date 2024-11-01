defmodule Pscop.Services.Accounts do

  import Ecto.Query, warn: false
  alias Pscop.Persistence.Repo

  alias Pscop.Schemas.Account

  def get_account_by_email(email) do
    from(u in Account,
      where: u.email == ^email
    )
    |> Repo.one()
  end

  def create_account(attrs \\ %{}) do
    email = Map.get(attrs, :email)

    case get_account_by_email(email) do
      nil ->
        %Account{}
        |> Account.changeset(attrs)
        |> Repo.insert()
      _user ->
        raise "This email is already assigned to an account"
    end
  end

  def authenticate_account(email, password) do
    account = get_account_by_email(email)

    case check_password(account, password) do
      true -> {:ok, account}
      _ -> {:error, "Invalid email or password"}
    end
  end

  defp check_password(nil, _password), do: false
  defp check_password(account, password) do
    Bcrypt.verify_pass(password, account.password_hash)
  end
end
