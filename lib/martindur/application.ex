defmodule Martindur.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MartindurWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:martindur, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Martindur.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Martindur.Finch},
      # Start a worker by calling: Martindur.Worker.start_link(arg)
      # {Martindur.Worker, arg},
      # Start to serve requests, typically the last entry
      MartindurWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Martindur.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MartindurWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
