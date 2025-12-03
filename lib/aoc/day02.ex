defmodule Aoc.Day02 do
  @spec is_repeated(integer()) :: boolean()
  def is_repeated(numbers) do
    n = Integer.to_string(numbers)
    len_num = String.length(n)

    case rem(len_num, 2) do
      1 ->
        false

      0 ->
        {first, last} = String.split_at(n, Integer.floor_div(len_num, 2))

        first == last
    end
  end

  def parse_data do
    case File.read("lib/aoc/day02data.txt") do
      {:ok, data} ->
        data
        |> String.trim()
        |> String.split(",")
        |> Enum.map(fn line ->
          String.split(line, "-")
          |> Enum.map(&String.to_integer/1)
        end)
        |> IO.inspect()
    end
  end

  def execute() do
  end
end
