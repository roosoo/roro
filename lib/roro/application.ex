defmodule Roro.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RoroWeb.Telemetry,
      # Start the Ecto repository
      Roro.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Roro.PubSub},
      # Start Finch
      {Finch, name: Roro.Finch},
      # Start the Endpoint (http/https)
      RoroWeb.Endpoint
      # Start a worker by calling: Roro.Worker.start_link(arg)
      # {Roro.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Roro.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RoroWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
