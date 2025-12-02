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
        IO.inspect(first == last)

        first == last
    end
  end
end
