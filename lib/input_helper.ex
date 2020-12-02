defmodule InputHelper do
  def get_input_string(filename) do
    File.read!(filename)
  end
end
