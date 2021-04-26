defmodule Summer.Boundary.Service do
  @moduledoc """
  Forget this, not using in production.
  """

  alias Summer.Core.Counter

  def start(string) do
    spawn(fn -> string |> Counter.new() |> run() end)
  end

  def inc(counter) do
    send(counter, :inc)
  end

  def get_count(counter) do
    send(counter, {:state, self()})

    receive do
      count -> count
    end
  end

  defp run(count) do
    count |> listen() |> run()
  end

  defp listen(count) do
    receive do
      :inc ->
        Counter.add(count, 1)

      {:state, from} ->
        send(from, count)
        count
    end
  end
end
