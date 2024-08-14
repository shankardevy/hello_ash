defmodule HelloAsh.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HelloAshWeb.Telemetry,
      HelloAsh.Repo,
      {DNSCluster, query: Application.get_env(:hello_ash, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: HelloAsh.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: HelloAsh.Finch},
      # Start a worker by calling: HelloAsh.Worker.start_link(arg)
      # {HelloAsh.Worker, arg},
      # Start to serve requests, typically the last entry
      HelloAshWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloAsh.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HelloAshWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
