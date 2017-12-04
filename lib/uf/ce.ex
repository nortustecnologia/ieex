defmodule CE do
  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if String.length(ie) == 9 do
      l_ie = Util.parse_ie(ie)
      # digito verificador
      [f_dig] = Util.get_digs(l_ie, 1)
      # remove o ultimo dígito
      rest_ie = List.delete_at(l_ie, -1)

      dig =
        rest_ie
        |> Util.calc_peso(@peso)
        |> rem(11)
        |> calc_mod_11

      f_dig == dig
    end
  end

  defp calc_mod_11(value) do
    result = (11 - value)
    
    if (result == 10 || result == 11), do: 0, else: result
  end
end
