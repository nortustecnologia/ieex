defmodule IEEx.UF.AC do  
  alias IEEx.Util

  @peso1 [4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
  @peso2 [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do # 01.004.823/001-12
    ie = Util.only_numbers(input)

    if (String.at(ie, 0) == "0" && String.at(ie, 1) == "1") && (String.length(ie) == 13) do
      l_ie = Util.parse_ie(ie)

      [f_dig, s_dig] = Util.get_digs(l_ie, 2)

      # recupera a ie ignorando os dois ultimos digitos
      rest_ie = 
        l_ie
        |> List.delete_at(-1) 
        |> List.delete_at(-1)

      f_dig_calc = return_digit(rest_ie, @peso1)
      # adiciona o dígito calculado na IE
      rest_ie = List.insert_at(rest_ie, -1, f_dig_calc)

      # calcula o segundo dígito verificador
      s_dig_calc = return_digit(rest_ie, @peso2)

      f_dig == f_dig_calc && s_dig == s_dig_calc
    else
      false
    end
  end

  defp calc_mod_11(value), do: 11 - value

  defp return_digit(ie, peso) do
    calc = 
      ie
      |> Util.calc_peso(peso)
      |> rem(11)
      |> calc_mod_11()

    cond do
      calc == 10 || calc == 11 ->
        0
      true ->
        calc
    end
  end
end
