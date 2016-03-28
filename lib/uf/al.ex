defmodule AL do
  import Util

  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do # 248547232
    ie = only_numbers(input)

    if (String.at(ie, 0) == "2" && String.at(ie, 1) == "4") && (String.length(ie) == 9) do
      # digito verificador
      first_digs = String.to_integer(String.at(ie, -1))
      # transforma a IE em uma lista de inteiros
      ie = extract_ie(ie)
      # remove o ultimo dígito
      ie = ie |> List.delete_at(-1)

      dig =
        Enum.map_reduce(@peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> product
          |> calc_mod_11

      if dig == 10, do: dig = 0

      dig == first_digs
    else
      false
    end
  end

  defp product(value), do: value * 10

  defp calc_mod_11(value), do: value - (trunc(value / 11) * 11)
end
