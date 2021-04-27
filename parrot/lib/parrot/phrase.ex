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

  def find(:michael_scott) do
    %{text: "Would I rather be feared or loved? Easy. Both. I want people to be afraid of how much they love me.", steps: 6}
  end

  def find(:kirby) do
    %{text: "whOOOOOOOOOOOOOOooooooo POP.", steps: 6}
  end
end
