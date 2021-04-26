defmodule Summer do
  @moduledoc """
  Keep Summer safe.
  """

  use GenServer

  alias Summer.Core.Counter

  def child_spec({name, _initial_string} = args) do
    %{id: name, start: {Summer, :start_link, [args]}}
  end

  def start_link({name, initial_string}) do
    IO.inspect("starting #{name}")
    GenServer.start_link(__MODULE__, initial_string, name: name)
  end

  def inc(counter) do
    GenServer.cast(counter, :inc)
  end

  def boom(counter) do
    GenServer.cast(counter, :boom)
  end

  def get_count(counter) do
    GenServer.call(counter, :get_count)
  end

  @impl true
  def init(initial_string) do
    initial = initial_string |> Counter.new()
    {:ok, initial}
  end

  @impl true
  def handle_call(:get_count, _from, count) do
    {:reply, Counter.render(count), count}
  end

  @impl true
  def handle_cast(:inc, count) do
    {:noreply, Counter.add(count, 1)}
  end

  def handle_cast(:boom, _count) do
    raise "boom"
  end
end
