defmodule Pscop.Application do

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Pscop.Persistence.Repo,
      {DNSCluster, query: Application.get_env(:pscop, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Pscop.PubSub},
      {Finch, name: Pscop.Finch},
      PscopWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Pscop.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    PscopWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
