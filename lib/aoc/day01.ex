defmodule Aoc.Day01 do
  def parseData() do
    case File.read("lib/aoc/day01data.txt") do
      {:ok, contet} ->
        contet
        |> String.split("\n")
        |> Enum.map(fn line -> String.trim(line) end)
        |> Enum.reject(fn line -> String.length(line) == 0 end)
        |> Enum.map(fn line ->
          # Split the current line string by the second delimiter
          String.split_at(line, 1)
          # Debugging each inner list
          |> IO.inspect(label: "Split Line")
  |> Enum.map(fn line -> Integer.parse(line.1))
        end)
    end
  end

  @spec rotate(integer()) :: integer()
  def rotate(amount) do
    rem(100, amount)
  end
end
