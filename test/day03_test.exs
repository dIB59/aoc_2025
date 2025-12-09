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
      |> IO.inspect(charlists: :as_lists)

    assert result == [8, 9]
  end

  test "largest joltage examples" do
    examples = [
      {"987654321111111", 98},
      {"811111111111119", 89},
      {"234234234234278", 78},
      {"818181911112111", 92}
    ]

    Enum.each(examples, fn {input, expected} ->
      result =
        input
        |> Day03.string_to_num_list()
        |> Day03.get_biggest(2)
        |> Enum.join()
        |> String.to_integer()
        |> IO.inspect(charlists: :as_lists)

      assert result == expected
    end)
  end

  test "execute" do
    Day03.execute()
    |> IO.inspect()
  end
end
