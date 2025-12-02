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
  @spec rotate_dial(integer(), String.t(), integer()) :: {integer(), integer()}
  def rotate_dial(current_pos, direction, amount) do
    movement =
      case direction do
        "R" -> amount
        "L" -> -amount
      end

    final_pos = Integer.mod(current_pos + movement, 100)

    # Calculate how many times the rotation crossed the 0/99 boundary.
    zero_clicks =
      case direction do
        "R" ->
          clicks =
            case {current_pos + amount, current_pos} do
              {0, _} -> 0
              {100, _} -> 0
              {_, 0} -> 0
              _ -> div(current_pos + amount, 100)
            end

          clicks

        "L" ->
          case {amount - current_pos, current_pos} do
            {_, 0} ->
              0

            {d, _} when d <= 0 ->
              0

            {d, _} ->
              # This counts all clicks on 0 during the L rotation.
              div(d + 99, 100)
          end
      end

    {final_pos, zero_clicks}
  end

  def execute() do
    case parseData() do
      {:ok, data} ->
        initial_state = {50, 0}

        data
        |> Enum.reduce(initial_state, fn {direction, amount}, {current_pos, count} ->
          {new_pos, cross_zero} = rotate_dial(current_pos, direction, amount)

          new_count =
            case new_pos do
              0 -> count + 1
              _ -> count
            end

          {new_pos, new_count + cross_zero}
        end)
        |> IO.inspect(label: "Final Count")

      {:error, message} ->
        IO.puts("Error: #{message}")
        :error
    end
  end
end
