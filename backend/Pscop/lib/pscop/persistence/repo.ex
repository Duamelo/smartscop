defmodule Pscop.Persistence.Repo do
  use Ecto.Repo,
    otp_app: :pscop,
    adapter: Ecto.Adapters.Postgres
end
