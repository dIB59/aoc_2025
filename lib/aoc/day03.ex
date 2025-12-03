defmodule Aoc.Day03 do
  def parse_data do
    case File.read("lib/aoc/day03data.txt") do
      {:ok, data} ->
        data
        |> String.trim()
        |> String.split("\n")
        |> Enum.map(&String.to_integer/1)
        |> IO.inspect()
    end
  end
end
