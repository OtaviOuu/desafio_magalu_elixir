defmodule DesafioMagalu.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DesafioMagaluWeb.Telemetry,
      DesafioMagalu.Repo,
      {DNSCluster, query: Application.get_env(:desafio_magalu, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DesafioMagalu.PubSub},
      # Start a worker by calling: DesafioMagalu.Worker.start_link(arg)
      # {DesafioMagalu.Worker, arg},
      # Start to serve requests, typically the last entry
      DesafioMagaluWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DesafioMagalu.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DesafioMagaluWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
