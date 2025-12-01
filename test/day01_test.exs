defmodule Day01Test do
  use ExUnit.Case
  doctest Aoc2025

  test "rotate/1 returns the correct remainder" do
    Aoc.Day01.parseData()

    Aoc.Day01.execute()
  end
end
