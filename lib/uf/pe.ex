defmodule PE do # 032141840
  @peso1 [8, 7, 6, 5, 4, 3, 2]
  @peso2 [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if String.length(ie) == 9 do
      l_ie = Util.parse_ie(ie)
      # extrai digito verificador
      [f_dig, s_dig] = Util.get_digs(l_ie, 2)
      # 
      rest_ie = 
        l_ie 
        |> List.delete_at(-1) 
        |> List.delete_at(-1)

      #
      resto =
        rest_ie
        |> Util.calc_peso(@peso1)
        |> rem(11)

      dv1 = if (resto == 0 || resto == 1), do: 0, else: (11 - resto)

      rest_ie = List.insert_at(rest_ie, -1, dv1)
      #
      resto =
        rest_ie
        |> Util.calc_peso(@peso2)
        |> rem(11)

      dv2 = if (resto == 0 || resto == 1), do: 0, else: (11 - resto)

      f_dig == dv1 && s_dig == dv2
    else
      false
    end
  end
end
