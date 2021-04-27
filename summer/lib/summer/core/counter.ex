defmodule Summer.Core.Counter do
  def add(total, number) do
    total + number
  end

  def subtract(total, number) do
    total - number
  end

  def new(initial) do
    String.to_integer(initial)
  end

  def render(total) do
    to_string(total)
  end
end
