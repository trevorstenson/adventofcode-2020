defmodule Day1 do
  @total 2020

  def find_three_entries(filename) do
    {x, y, z} =
      prep_input(filename)
      |> three_sum(@total)
    x * y * z
  end

  def find_two_entries(filename) do
    {one, two} =
    prep_input(filename)
    |> two_sum(@total)
    one * two
  end

  def three_sum(data, goal) do
    data
    |> Enum.with_index
    |> Enum.reduce_while({}, fn {val, idx}, acc ->
      {x, y} =
        List.delete_at(data, idx)
        |> two_sum(@total - val)
      if (x + y) == (@total - val), do: {:halt, {x, y, val}}, else: {:cont, acc}
    end)
  end

  def two_sum(data, goal) do
    ans =
      Enum.reduce_while(data, {}, fn x, acc ->
        difference = goal - x
        case Enum.find(data, &(&1 == difference)) do
          nil -> {:cont, acc}
          j   -> {:halt, {x, j}}
        end
      end)
    if tuple_size(ans) == 0, do: {-1, -1}, else: ans
  end

  def prep_input(filename) do
    filename
    |> File.read!
    |> String.split
    |> Enum.map(&String.to_integer/1)
  end
end
