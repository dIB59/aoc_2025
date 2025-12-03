defmodule Aoc.Day02 do
  @spec is_repeated(integer()) :: boolean()
  def is_repeated(numbers) do
    n = Integer.to_string(numbers)
    len = String.length(n)

    case len do
      1 ->
        false

      _ ->
        Enum.any?(1..div(len, 2), fn sub_len ->
          rem(len, sub_len) == 0 and
            String.duplicate(String.slice(n, 0, sub_len), div(len, sub_len)) == n
        end)
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
    end
  end

  def execute() do
    parse_data()
    |> Enum.map(fn [a, b] ->
      a..b
      |> Enum.filter(&is_repeated/1)
    end)
    |> Enum.reject(fn s -> length(s) == 0 end)
    |> Enum.flat_map(fn
      x when is_list(x) -> x
      _ -> []
    end)
    |> Enum.sum()
  end
end
