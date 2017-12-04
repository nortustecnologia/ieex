defmodule SP12 do # 110042490114 - 0 e 4 são digitos verificadores
  @peso1 [1, 3, 4, 5, 6, 7, 8, 10]
  @peso2 [3, 2, 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    l_ie = 
      input
      |> Util.only_numbers()
      |> Util.parse_ie()

    # extrai digito verificador
    f_dig = String.to_integer(String.at(input, 8))
    s_dig = String.to_integer(String.at(input, -1))
    # divide a inscrição estadual em duas partes
    first_part_ie = Enum.slice(l_ie, 0..7)
    second_part_ie = Enum.slice(l_ie, 9..11)
    #
    dv1 =
      first_part_ie
      |> Util.calc_peso(@peso1)
      |> rem(11)
      |> Integer.to_string
      |> String.at(-1)
      |> String.to_integer

    # adiciona o digito calculado na IE e concatena a segunda lista para o calc.
    new_ie = Enum.concat(List.insert_at(first_part_ie, -1, dv1), second_part_ie)

    dv2 =
      new_ie
      |> Util.calc_peso(@peso2)
      |> rem(11)
      |> Integer.to_string
      |> String.at(-1)
      |> String.to_integer

    f_dig == dv1 && s_dig == dv2
  end
end
