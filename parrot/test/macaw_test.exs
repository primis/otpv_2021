defmodule MacawTest do
  use ExUnit.Case
  alias Parrot.Eraser

  test "TNew for right number of splits" do
    # 24 chars
    phrase = "test phrases to remember"
    expected = 4

    eraser = Eraser.new(phrase, expected)
    eraser.plan |> length |> assert_value(expected)
  end

  test "New for even splits" do
    # 24 chars
    phrase = "test phrases to remember"
    expected = 4
    eraser = Eraser.new(phrase, 6)
    lengths = Enum.map(eraser.plan, &steplength/1)
    assert Enum.all?(lengths, fn actual -> actual == expected end)
  end

  test "New for uneven splits" do
    # 24 chars
    phrase = "test phrases to remember"
    expected = 6
    eraser = Eraser.new(phrase, 5)
    lengths = Enum.map(eraser.plan, &steplength/1)
    {min, max} = Enum.min_max(lengths)
    assert {min, max} == {4, 5}
  end

  test "New for randomness" do
    # 24 chars
    phrase = "test phrases to remember"
    eraser1 = Eraser.new(phrase, 4)
    eraser2 = Eraser.new(phrase, 4)
    assert eraser1 != eraser2
  end

  test "Eraser works" do
    # stub out new
    plan = [[1], [23]]
    text = "test phrases to remember"
    expected1 = "t_st phrases to remember"
    expected2 = "t_st phrases to remembe_"

    %Parrot.Eraser{plan: plan, text: text, plucked_text: String.to_charlist(text)}
    |> Eraser.erase()
    |> assert_text(expected1)
    |> Eraser.erase()
    |> assert_text(expected2)
  end

  defp steplength(step) do
    length(step)
  end

  defp assert_text(actual, expected) do
    assert Eraser.text(actual) == expected
    actual
  end

  defp assert_value(actual, expected) do
    assert actual == expected
    actual
  end
end
