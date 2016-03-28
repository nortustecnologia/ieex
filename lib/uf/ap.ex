defmodule AP do
  import Util
  require IEx

  @peso [9, 8, 7, 6, 5, 4, 3, 2]
  @p 0
  @d 0

  def is_valid?(input) do # 030123459
    ie = only_numbers(input)

    if (String.at(ie, 0) == "0" && String.at(ie, 1) == "3") do
      # digito verificador
      first_digs = String.to_integer(String.at(ie, -1))
      # transforma a IE em uma lista de inteiros
      ie = Enum.map(String.codepoints(ie), fn(x) -> String.to_integer(x) end)
      # remove o ultimo dígito
      ie = ie |> List.delete_at(-1)

      ie_join = Enum.join(ie)
      p = 0 # default
      d = 0 # default

      # verifica em qual intervalo a IE está
      if (ie_join >= "03000001" && ie_join <= "03017000") do
        p = 5
        d = 0
      end
      if (ie_join >= "03017001" && ie_join <= "03019022") do
        p = 9
        d = 1
      end

      dig =
        Enum.map_reduce(@peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> calc_mod_11(p, d)

      dig == first_digs
    else
      false
    end
  end

  defp calc_mod_11(value, p, d) do
    result = (11 - rem((value + p), 11))
    case result do
      10 -> 0
      11 -> d
      _ -> result
    end
  end
end
