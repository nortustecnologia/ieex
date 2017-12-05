defmodule IEEx.UF.SPP do
  alias IEEx.Util
  
  @peso [1, 3, 4, 5, 6, 7, 8, 10]

  def is_valid?(input) do
    l_ie = 
      input
      |> Util.only_numbers()
      |> Util.parse_ie()

    # extrai digito verificador
    f_dig = Enum.at(l_ie, 8)
    # divide a inscrição estadual em duas partes
    rest_ie = Enum.slice(l_ie, 0..7)
    #
    dv1 =
      rest_ie
      |> Util.calc_peso(@peso)
      |> rem(11)
      |> Integer.to_string
      |> String.at(-1)
      |> String.to_integer

    f_dig == dv1
  end
end
