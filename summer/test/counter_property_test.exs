defmodule CounterPropertyTest do
  use ExUnit.Case

  alias Summer.Core.Counter

  test("properties of add/2 result") do
    values = for x <- -100..100, y <- 1..100, do: {x, y, Counter.add(x, y)}

    # compare properties of results to expectations
    assert Enum.all?(values, &assert_greater_than_input/1)
    assert Enum.all?(values, &assert_is_number/1)
  end

  defp assert_greater_than_input({x, _y, total}) do
    total > x
  end

  defp assert_is_number({_x, _y, total}) do
    is_integer(total)
  end
end
