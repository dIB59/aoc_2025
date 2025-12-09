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
  def get_biggest(list, n), do: do_get_biggest(list, n, [])

  defp do_get_biggest(_list, 0, acc), do: Enum.reverse(acc)
  defp do_get_biggest([], _n, acc), do: Enum.reverse(acc)

  defp do_get_biggest(list, n, acc) do
    # We need to pick n more digits
    # We can only look at the first (length - n + 1) positions
    # to ensure we have enough digits left after our choice
    search_range = length(list) - n + 1

    # Get the sublist we can search in
    searchable = Enum.take(list, search_range)

    # Find the maximum in that range
    max = Enum.max(searchable)

    # Find the first occurrence of that max
    max_index = Enum.find_index(list, &(&1 == max))

    # Keep only elements after the chosen maximum
    rest = Enum.slice(list, (max_index + 1)..-1//1)

    # Add max to accumulator and recurse
    do_get_biggest(rest, n - 1, [max | acc])
  end

  def execute do
    parse_data()
    |> Enum.map(fn line -> get_biggest(line, 2) end)
    |> Enum.map(fn line -> Enum.join(line) |> String.to_integer() end)
    |> Enum.sum()
  end
end
