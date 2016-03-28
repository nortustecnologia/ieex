defmodule AC do
  import Util

  @peso1 [4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
  @peso2 [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do # 01.004.823/001-12
    # remove caracteres especiais
    ie = only_numbers(input)

    if (String.at(ie, 0) == "0" && String.at(ie, 1) == "1") && (String.length(ie) == 13) do
      # extrai os dois digitos verificadores da IE
      first_digs = String.to_integer(String.at(ie, -2))
      second_digs = String.to_integer(String.at(ie, -1))

      # transforma a IE em uma lista de inteiros
      ie = Enum.map(String.codepoints(ie), fn(x) -> String.to_integer(x) end)

      # remove os dois ultimos dígito
      ie = ie |> List.delete_at(-1) |> List.delete_at(-1)

      # realiza os calculos e faz as conversões necessárias para retornar
      # o valor do primeiro dígito
      dig1_calc = return_digit(ie, @peso1)

      if (dig1_calc == 10 || dig1_calc == 11), do: dig1_calc = 0

      # adiciona o dígito calculado na IE
      ie = List.insert_at(ie, -1, dig1_calc)

      # calcula o segundo dígito verificador
      dig2_calc = return_digit(ie, @peso2)

      if (dig2_calc == 10 || dig2_calc == 11), do: dig2_calc = 0

      first_digs == dig1_calc && second_digs == dig2_calc
    else
      false
    end
  end

  defp calc_mod_11(value), do: 11 - value

  defp return_digit(ie, peso) do
    Enum.map_reduce(peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
      |> Tuple.to_list
      |> Enum.at(0)
      |> Enum.sum
      |> rem(11)
      |> calc_mod_11
  end
end
