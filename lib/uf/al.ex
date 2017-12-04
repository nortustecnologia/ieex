defmodule AL do
  alias Util

  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do # 248547232
    ie = Util.only_numbers(input)

    if (String.at(ie, 0) == "2" && String.at(ie, 1) == "4") && (String.length(ie) == 9) do
      # transforma a IE em uma lista de inteiros
      l_ie = Util.parse_ie(ie)

      [f_dig] = Util.get_digs(l_ie, 1)

      # remove o ultimo dígito
      rest_ie = List.delete_at(l_ie, -1)

      dig = 
        rest_ie
        |> Util.calc_peso(@peso)
        |> product
        |> calc_mod_11

      dig = if dig == 10, do: 0, else: dig

      dig == f_dig
    else
      false
    end
  end

  defp product(value), do: value * 10

  defp calc_mod_11(value), do: value - (trunc(value / 11) * 11)
end