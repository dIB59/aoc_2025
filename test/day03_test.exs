defmodule Day03Test do
  use ExUnit.Case
  doctest Aoc2025
  alias Aoc.Day03

  test "parse data" do
    Day03.parse_data()
  end

  test "get largest" do
    assert [9, 8] ==
             Day03.get_biggest([9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1], 2)
             |> IO.inspect(charlists: :as_lists)
  end

  test "string to list" do
    result =
      "811111111111119"
      |> Day03.string_to_num_list()
      |> Day03.get_biggest(2)

    assert result == [8, 9]
  end

  test "execute" do
    Day03.execute()
    |> IO.inspect()
  end
end
