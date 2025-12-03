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
    end
  end

  def string_to_num_list(line) do
    line
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
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

  def execute do
    parse_data()
    |> Enum.map(fn line -> get_biggest(line, 2) end)
    |> Enum.map(fn line -> Enum.join(line) |> String.to_integer() end)
    |> Enum.sum()
  end
end
