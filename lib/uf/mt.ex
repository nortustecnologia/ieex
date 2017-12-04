defmodule MT do # 00130000019
  @peso [3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if String.length(ie) == 11 do
      l_ie = Util.parse_ie(ie)
      # extrai digito verificador
      [f_dig] = Util.get_digs(l_ie, 1)
      # remove o digito verificador
      rest_ie = List.delete_at(l_ie, -1)
      #
      resto =
        rest_ie
        |> Util.calc_peso(@peso)
        |> rem(11)

      dv = if (resto == 0 || resto == 1), do: 0, else: 11 - resto

      f_dig == dv
    else
      false
    end
  end
end
