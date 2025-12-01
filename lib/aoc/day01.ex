defmodule Aoc.Day01 do
  @spec parseData() :: {:ok, [{String.t(), integer()}]} | {:error, atom()}
  def parseData() do
    case File.read("lib/aoc/day01data.txt") do
      {:ok, contet} ->
        parsed_list =
          contet
          |> String.split("\n")
          |> Enum.map(fn line -> String.trim(line) end)
          |> Enum.reject(fn line -> String.length(line) == 0 end)
          |> Enum.map(fn line ->
            {first_char, rest_of_line} = String.split_at(line, 1)

            # 2. Parse the number part
            parsed_number =
              rest_of_line
              |> String.trim()
              |> Integer.parse()
              |> elem(0)

            # 3. Return a tuple containing the ORIGINAL line AND the parsed number
            {first_char, parsed_number}
          end)

        {:ok, parsed_list}

      {:error, reason} ->
        {:error, reason}
    end
  end

  # This is the new function that correctly handles circular rotation (0-99).
  @spec rotate_dial(integer(), String.t(), integer()) :: integer()
  defp rotate_dial(current_pos, direction, amount) do
    # 1. Calculate the initial movement
    initial_movement =
      case direction do
        # Right: Add
        "R" -> current_pos + amount
        # Left: Subtract
        "L" -> current_pos - amount
      end

    IO.inspect(initial_movement / 100)
    rem(initial_movement, 100)
  end

  def execute() do
    case parseData() do
      {:ok, data} ->
        data
        |> Enum.reduce(0, fn {direction, amount}, acc ->
          rotation_result =
            case direction do
              "L" -> rotate(-amount)
              "R" -> rotate(amount)
            end

          IO.inspect(rotation_result)

          new_acc =
            case rotation_result do
              0 -> acc + 1
              _ -> acc
            end

          new_acc
        end)
        |> IO.inspect(label: "Final Count")

      {:error, message} ->
        IO.puts("Error: #{message}")
        :error
    end
  end
end
