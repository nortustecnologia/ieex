defmodule IEEx.UF.DF do
  alias IEEx.Util
  
  @peso1 [4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
  @peso2 [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if (String.at(ie, 0) == "0" && String.at(ie, 1) == "7") do # 07156452001-18
      l_ie = Util.parse_ie(ie)
      # extrai os dois digitos verificadores da IE
      [f_dig, s_dig] = Util.get_digs(l_ie, 2)
      #
      rest_ie =
        l_ie
        |> List.delete_at(-1) 
        |> List.delete_at(-1)

      dv1 =
        rest_ie
        |> Util.calc_peso(@peso1)
        |> rem(11)
        |> calc_mod_11

      # adiciona o dig. calculado a IE
      rest_ie = List.insert_at(rest_ie, -1, dv1)

      dv2 =
        rest_ie
        |> Util.calc_peso(@peso2)
        |> rem(11)
        |> calc_mod_11

      f_dig == dv1 && s_dig == dv2
    else
      false
    end
  end
  
  defp calc_mod_11(value) do
    result = (11 - value)

    if (result == 10 || result == 11), do: 0, else: result
  end
end
