defmodule Summer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Summer.Worker.start_link(arg)
      {Summer, {:allie, "42"}},
      {Summer, {:spoff, "43"}},
      {Summer, {:mitchel, "42"}},
      {Summer, {:lindy, "24"}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Summer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
