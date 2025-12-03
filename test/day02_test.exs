defmodule Day02Test do
  use ExUnit.Case
  doctest Aoc2025
  alias Aoc.Day02

  describe "is_repeated/1" do
    test "returns true for one-digit repeated IDs" do
      # invalid IDs (repeated halves)
      assert Day02.is_repeated(1) == false
      assert Day02.is_repeated(2) == false
    end

    test "returns true for two-digit repeated IDs" do
      # invalid IDs (repeated halves)
      assert Day02.is_repeated(11) == true
      assert Day02.is_repeated(22) == true
    end

    test "returns true for larger repeated ID" do
      # invalid ID (repeated halves)
      assert Day02.is_repeated(1_188_511_885) == true
    end

    test "returns false for even-length but non-repeated number" do
      assert Day02.is_repeated(1234) == false
    end

    test "returns false for odd-length numbers" do
      assert Day02.is_repeated(123) == false
    end
  end

  describe "generate_list" do
    test "Parse data" do
      # invalid IDs (repeated halves)
      assert Day02.parse_data()
    end

    test "Execute" do
      # invalid IDs (repeated halves)
      assert Day02.execute()
    end
  end
end
