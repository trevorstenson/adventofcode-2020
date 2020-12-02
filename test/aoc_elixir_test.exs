defmodule AocElixirTest do
  use ExUnit.Case
  doctest AocElixir
  # import Day1

  test "day 1 expense report" do
    assert 870331 == Day1.find_two_entries("./test/inputs/day1.txt")
  end

  test "day 1 triple report" do
    assert 283025088 == Day1.find_three_entries("./test/inputs/day1.txt")
  end
end
