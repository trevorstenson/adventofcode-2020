defmodule Day3 do
  def count_trees(filename) do
    data = prep_input(filename)
    width = Enum.count(Enum.at(data, 0))
    height = Enum.count(data)
    gen_y_values(1, height)
    |> test_slope(3, width, data)
  end

  def part_two_all_slopes(filename) do
    data = prep_input(filename)
    width = Enum.count(Enum.at(data, 0))
    height = Enum.count(data)
    [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}]
    |> Enum.reduce(1, fn {x, y}, acc ->
      gen_y_values(y, height)
      |> test_slope(x, width, data)
      |> Kernel.*(acc)
    end)
  end

  defp test_slope(y_values, x_step, width, data) do
    Enum.reduce(y_values, 0, fn y, acc ->
      result =
        {rem((y * x_step), width), y}
        |> is_tree(data)
      if result, do: acc + 1, else: acc
    end)
  end

  defp gen_y_values(jump, height) do
    0..height-1 |> Stream.take_every(jump) |> Enum.to_list()
  end

  defp is_tree({x, y}, data) do
    Enum.at(Enum.at(data, y), x) == "#"
  end

  defp prep_input(filename) do
    File.read!(filename)
    |> String.split
    |> Enum.map(&String.graphemes/1)
  end
end
