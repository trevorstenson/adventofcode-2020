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

  test "day 2 valid passwords" do
    assert 564 == Day2.valid_passwords("./test/inputs/day2.txt")
  end

  test "day 2 part two" do
    IO.inspect Day2.part_two("./test/inputs/day2.txt")
  end
end
