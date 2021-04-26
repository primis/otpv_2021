defmodule CounterTest do
  use ExUnit.Case

  alias Summer.Core.Counter

  test("Core counter does the needful") do
    "42"
    |> Counter.new()
    |> assert_value(42)
    |> Counter.add(1)
    |> assert_value(43)
    |> Counter.add(1)
    |> assert_value(44)
    |> Counter.subtract(1)
    |> assert_value(43)
    |> Counter.render()
    |> assert_value("43")
  end

  defp assert_value(actual, expected) do
    assert actual == expected
    actual
  end
end
