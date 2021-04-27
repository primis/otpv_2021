defmodule AviaryTest do
  use ExUnit.Case
  doctest Aviary

  test "greets the world" do
    assert Aviary.hello() == :world
  end
end
