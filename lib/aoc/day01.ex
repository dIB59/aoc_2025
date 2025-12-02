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

  @spec rotate_dial(integer(), String.t(), integer()) :: {integer(), integer()}
  def rotate_dial(current_pos, direction, amount) do
    movement =
      case direction do
        "R" -> amount
        "L" -> -amount
      end

    final_pos = Integer.mod(current_pos + movement, 100)

    zero_clicks =
      case direction do
        # A click occurs every time the total distance (current_pos + amount)
        # crosses a multiple of 100. Integer division handles this.
        "R" ->
          total_distance = current_pos + amount
          div(total_distance - 1, 100)

        "L" ->
          past_zero_distance = amount - current_pos

          cond do
            current_pos == 0 and amount < 100 ->
              0

            past_zero_distance <= 0 ->
              0

            # General case: Count how many full 100-step segments are covered past 0.
            true ->
              div(past_zero_distance + 99, 100)
          end
      end

    {final_pos, zero_clicks}
  end

  def execute() do
    d =
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

        {:error, message} ->
          IO.puts("Error: #{message}")
          :error
      end

    d
  end
end
