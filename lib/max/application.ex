defmodule Max.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MaxWeb.Telemetry,
      Max.Repo,
      {DNSCluster, query: Application.get_env(:max, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Max.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Max.Finch},
      # Start a worker by calling: Max.Worker.start_link(arg)
      # {Max.Worker, arg},
      # Start to serve requests, typically the last entry
      MaxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Max.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MaxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
