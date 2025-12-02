defmodule Day01Test do
  use ExUnit.Case
  doctest Aoc2025

  describe "rotate_dial_testable/3" do
    test "right rotation without wrap" do
      assert Aoc.Day01.rotate_dial(10, "R", 5) == {15, 0}
    end

    test "right rotation wraps once" do
      # 95 + 10 = 105 -> final 5, crossed boundary once
      assert Aoc.Day01.rotate_dial(95, "R", 10) == {5, 1}
    end

    test "right rotation wraps multiple times" do
      # 10 + 250 = 260 -> final 60, crossed 2 times (260 div 100 == 2)
      assert Aoc.Day01.rotate_dial(10, "R", 250) == {60, 2}
    end

    test "left rotation without wrap" do
      # 50 - 30 = 20, no crossing
      assert Aoc.Day01.rotate_dial(50, "L", 30) == {20, 0}
    end

    test "left rotation wraps once" do
      # 10 - 15 = -5 -> final 95, crossed once
      assert Aoc.Day01.rotate_dial(10, "L", 15) == {95, 1}
    end

    test "left rotation wraps multiple times" do
      # 10 - 350 = -340 -> final 60
      # distance_past_zero = 350 - 10 = 340 -> (340 + 99) div 100 = 4
      assert Aoc.Day01.rotate_dial(10, "L", 350) == {60, 4}
    end
  end

  describe "dial rotations" do
    test "full sequence of dial rotations" do
      # Start at 50
      assert Aoc.Day01.rotate_dial(50, "L", 68) == {82, 1}
      assert Aoc.Day01.rotate_dial(82, "L", 30) == {52, 0}
      assert Aoc.Day01.rotate_dial(52, "R", 48) == {0, 0}
      assert Aoc.Day01.rotate_dial(0, "L", 5) == {95, 0}
      assert Aoc.Day01.rotate_dial(95, "R", 60) == {55, 1}
      assert Aoc.Day01.rotate_dial(55, "L", 55) == {0, 0}
      assert Aoc.Day01.rotate_dial(0, "L", 1) == {99, 0}
      assert Aoc.Day01.rotate_dial(99, "L", 99) == {0, 0}
      assert Aoc.Day01.rotate_dial(0, "R", 14) == {14, 0}
      assert Aoc.Day01.rotate_dial(14, "L", 82) == {32, 1}
      assert Aoc.Day01.rotate_dial(0, "R", 638) == {38, 6}
    end
  end

  test "rotate/1 returns the correct remainder" do
    IO.inspect(Aoc.Day01.execute())
  end
end
