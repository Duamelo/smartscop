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
end
