defmodule Parrot.Phrase do
  alias Parrot.Eraser

  def eraser(atom \\ :itcrowd) do
    flashcard = find(atom)
    Eraser.new(flashcard.text, flashcard.steps)
  end

  def find(:itcrowd) do
    %{text: "did you try turning it off and on again?", steps: 3}
  end

  def find(:wright) do
    %{text: "I intend to live forever. So far, so good.", steps: 5}
  end

  def find(:ozzy) do
    %{text: "Of all the things I lost, I miss my mind the most.", steps: 4}
  end
end
