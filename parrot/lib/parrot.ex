defmodule Parrot do
  @moduledoc """
  Documentation for Parrot.
  """

  @doc """
    Parrot provides a memory game, gradually deleting characters from a string
    This file implements the GenServer which can be used to run the game.
  """
  use GenServer
  alias Parrot.{Eraser, Phrase}

  def start_link(phrase) do
    GenServer.start_link(__MODULE__, phrase)
  end

  def erase(server) do
    clear()
    GenServer.call(server, :next) |> IO.puts()
  end

  @impl GenServer
  def init(phrase) do
    eraser = Phrase.eraser(phrase)
    IO.puts(Eraser.text(eraser))
    {:ok, eraser}
  end

  @impl GenServer
  def handle_call(:next, _from, eraser) do
    new_eraser = Eraser.erase(eraser)
    erased_text = Eraser.text(new_eraser)
    {:reply, erased_text, new_eraser}
  end

  defp clear() do
    IO.puts(IO.ANSI.clear())
  end
end
