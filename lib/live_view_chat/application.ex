defmodule LiveViewChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveViewChatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveViewChat.PubSub},
      # Start the Endpoint (http/https)
      LiveViewChatWeb.Endpoint,
      LiveViewChatWeb.Presence
      # Start a worker by calling: LiveViewChat.Worker.start_link(arg)
      # {LiveViewChat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveViewChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveViewChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
