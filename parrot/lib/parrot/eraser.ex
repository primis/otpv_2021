defmodule Parrot.Eraser do
  defstruct ~w[plan text]a

  def new(text, steps) do
    # ...
  end

  def erase(eraser) do
    # ...
  end

  def text(eraser) do
    eraser.text
  end
end
