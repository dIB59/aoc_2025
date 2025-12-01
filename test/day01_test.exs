defmodule Day01Test do
  use ExUnit.Case
  doctest Aoc2025

  test "rotate/1 returns the correct remainder" do
    Aoc.Day01.parseData()

    # 100 rem 3 should be 1
    assert Aoc.Day01.rotate(3) == 1

    # 100 rem 7 should be 2
    assert Aoc.Day01.rotate(7) == 2

    # 100 rem 100 should be 0
    assert Aoc.Day01.rotate(100) == 0
  end
end
