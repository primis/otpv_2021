defmodule Aviary do
  @moduledoc """
  Documentation for `Aviary`.
  """

  def hatch_parrot(name, flashcard \\ %{text: "A brave new world.", steps: 3}) do
    {:ok, _hatchling} = DynamicSupervisor.start_child(Aviary.DynamicSupervisor, Parrot.child_spec({name, flashcard}))
  end
end
