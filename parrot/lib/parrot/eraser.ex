defmodule Parrot.Eraser do
  @moduledoc """
    %Eraser{
      plan: [
        [1, 2, 3],
        [1, 2, 3],
        [1, 2, 3]
      ],
      text: "some quote",
      plucked_text: "some quote"
    }
  """

  @replace_char ?_
  @allowed_chars Enum.to_list(?A..?Z) ++ Enum.to_list(?a..?z)

  defstruct ~w[plan text plucked_text]a

  def new(text, steps) do
    length = String.length(text)
    chunk_size = ceil(length / steps)

    plan =
      0..(length - 1)
      |> Enum.shuffle()
      |> Enum.chunk_every(chunk_size)

    %__MODULE__{plan: plan, text: text, plucked_text: String.to_charlist(text)}
  end

  def erase(
        %__MODULE__{plan: [current_step | remaining_steps], plucked_text: plucked_text} = eraser
      ) do
    new_plucked_text = Enum.reduce(current_step, plucked_text, &replace_char/2)

    %{eraser | plan: remaining_steps, plucked_text: new_plucked_text}
  end

  def text(eraser) do
    to_string(eraser.plucked_text)
  end

  defp replace_char(position_to_replace, acc_charlist) do
    case Enum.at(acc_charlist, position_to_replace) in @allowed_chars do
      true -> List.replace_at(acc_charlist, position_to_replace, @replace_char)
      false -> acc_charlist
    end
  end
end
