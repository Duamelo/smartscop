defmodule PscopWeb.ConnCase do

  use ExUnit.CaseTemplate

  using do
    quote do
      @endpoint PscopWeb.Endpoint

      use PscopWeb, :verified_routes

      import Plug.Conn
      import Phoenix.ConnTest
      import PscopWeb.ConnCase
    end
  end

  setup tags do
    Pscop.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
