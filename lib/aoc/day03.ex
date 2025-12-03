defmodule Aoc.Day03 do
  def parse_data do
    case File.read("lib/aoc/day03data.txt") do
      {:ok, data} ->
        data
        |> String.trim()
        |> String.split("\n")
        |> Enum.map(fn line ->
          String.graphemes(line)
          |> Enum.map(&String.to_integer/1)
        end)
        |> IO.inspect()
    end
  end

  @spec get_biggest(list(), integer()) :: list()
  def get_biggest(list, num) do
    list
    |> Enum.with_index()
    |> Enum.sort_by(fn {num, _i} -> num end)
    |> Enum.reverse()
    |> Enum.take(num)
    |> Enum.sort_by(fn {_num, idx} -> idx end)
    |> Enum.map(fn {num, _i} -> num end)
  end
end
