defmodule Parrot.Eraser do
  defstruct ~w[plan text]a

  def new(text, steps) do
    length = String.length(text)
    chunk_size = ceil(length / steps)

    plan =
      0..length
      |> Enum.shuffle()
      |> Enum.chunk_every(chunk_size)

    %__MODULE__{plan: plan, text: text}
  end

  def erase(eraser) do
    # ...
  end

  def text(eraser) do
    eraser.text
  end
end
