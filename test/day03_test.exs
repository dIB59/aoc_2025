defmodule Day03Test do
  use ExUnit.Case
  doctest Aoc2025
  alias Aoc.Day03

  test "parse data" do
    Day03.parse_data()
  end

  test "get largest" do
    Day03.get_biggest([1, 2, 2, 4, 5, 7, 9], 2)
    |> IO.inspect(charlists: :as_lists)
  end
end
