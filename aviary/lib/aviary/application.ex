defmodule Aviary.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # children = [
    #   # Starts a worker by calling: Aviary.Worker.start_link(arg)
    #   {Parrot, {:bruce, :itcrowd}},
    #   {Parrot, {:allie, :ozzy}},
    #   {Parrot, {:spoff, :kirby}},
    #   {Parrot, {:lindy, :wright}},
    #   {Parrot, {:mitchel, :michael_scott}}
    # ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Aviary.DynamicSupervisor]
    DynamicSupervisor.start_link(opts)
  end
end
