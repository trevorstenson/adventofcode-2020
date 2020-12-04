defmodule AocElixirTest do
  use ExUnit.Case
  doctest AocElixir

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
    assert 325 == Day2.part_two("./test/inputs/day2.txt")
  end

  test "day 3" do
    assert 274 == Day3.count_trees("./test/inputs/day3.txt")
  end

  test "day 3 part two" do
    assert 6050183040 == Day3.part_two_all_slopes("./test/inputs/day3.txt")
  end
end
