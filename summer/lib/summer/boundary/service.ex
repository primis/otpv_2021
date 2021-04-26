defmodule Summer.Boundary.Service do
  alias Summer.Core.Counter

  def start(string) do
    spawn(fn -> string |> Counter.new() |> run() end)
  end

  def run(count) do
    count |> listen() |> run()
  end

  def listen(count) do
    receive do
      :inc ->
        Counter.add(count, 1)

      {:state, from} ->
        send(from, count)
        Counter.render(count)
    end
  end
end
