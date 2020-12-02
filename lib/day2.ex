defmodule Day2 do

  def part_two(filename) do
    prep_input(filename)
    |> Enum.map(fn {x, y, z} ->
      indices =
        String.split(x, "-")
        |> Enum.map(&String.to_integer/1)
      {indices, y, z}
    end)
    |> Enum.reduce(0, fn data, acc ->
      if check_part_two_password(data), do: acc + 1, else: acc
    end)
  end

  def check_part_two_password({indices, char, password}) do
    Enum.reduce(indices, 0, fn idx, acc ->
      if Enum.at(String.graphemes(password), (idx - 1)) == char, do: acc + 1, else: acc
    end)
    |> Kernel.==(1)
  end

  def valid_passwords(filename) do
    prep_input(filename)
    |> Enum.map(fn {x, y, z} -> {make_range(x), y, z} end)
    |> Enum.reduce(0, fn data, acc ->
      if check_password(data), do: acc + 1, else: acc
    end)
  end

  def check_password({range, char, password}) do
    count =
      Enum.reduce(String.graphemes(password), 0, fn c, acc ->
        if c == char, do: acc + 1, else: acc
      end)
    Enum.member?(range, count)
  end

  def construct_data(line) do
    String.replace(line, ":", "")
    |> String.split(" ")
    |> List.to_tuple
  end

  def make_range(str) do
    String.split(str, "-")
    |> Enum.map(&String.to_integer/1)
    |> (fn [x, y] -> x..y end).()
  end

  def prep_input(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.map(&construct_data/1)
  end
end
