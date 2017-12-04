defmodule AP do
  alias Util

  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do # 030123459
    ie = Util.only_numbers(input)

    if (String.at(ie, 0) == "0" && String.at(ie, 1) == "3") do
      # transforma a IE em uma lista de inteiros
      l_ie = Util.parse_ie(ie)
      # digito verificador
      [f_dig] = Util.get_digs(l_ie, 1)
      # remove o ultimo dígito
      rest_ie = List.delete_at(l_ie, -1)

      ie_join = Enum.join(rest_ie)

      # verifica em qual intervalo a IE está
      {p, d} =
        cond do
          (ie_join >= "03000001" && ie_join <= "03017000") ->
            {5, 0}
          (ie_join >= "03017001" && ie_join <= "03019022") ->
            {9, 1}
          true ->
            {0, 0}
        end

      dig =
        rest_ie
        |> Util.calc_peso(@peso)
        |> calc_mod_11(p, d)

      dig == f_dig
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
