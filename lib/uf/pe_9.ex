defmodule IEEx.UF.PE9 do # 032141840
  alias IEEx.Util

  @peso1 [8, 7, 6, 5, 4, 3, 2]
  @peso2 [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    l_ie = 
      input
      |> Util.only_numbers()
      |> Util.parse_ie()

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
  end
end
