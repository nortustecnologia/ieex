defmodule DF do
  import Util

  @peso1 [4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
  @peso2 [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = only_numbers(input)
    if (String.at(ie, 0) == "0" && String.at(ie, 1) == "7") do # 07156452001-18
      # extrai os dois digitos verificadores da IE
      first_dv = String.to_integer(String.at(ie, -2))
      second_dv = String.to_integer(String.at(ie, -1))
      #
      ie = extract_ie(ie) |> List.delete_at(-1) |> List.delete_at(-1)
      dv1 =
        Enum.map_reduce(@peso1, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> rem(11)
          |> calc_mod_11

      # adiciona o dig. calculado a IE
      ie = List.insert_at(ie, -1, dv1)
      dv2 =
        Enum.map_reduce(@peso2, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> rem(11)
          |> calc_mod_11

      first_dv == dv1 && second_dv == dv2
    else
      false
    end
  end

  defp calc_mod_11(value) do
    result = (11 - value)
    if (result == 10 || result == 11), do: 0, else: result
  end
end
