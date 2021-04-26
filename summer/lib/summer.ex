defmodule Summer do
  @moduledoc """
  Keep Summer safe.
  """

  use GenServer

  alias Summer.Core.Counter

  def start_link(initial_string) do
    GenServer.start_link(__MODULE__, initial_string)
  end
  def inc(counter) do
    GenServer.cast(counter, :inc)
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
end
