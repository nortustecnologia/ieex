defmodule IEEx.UF.RO9 do
  alias IEEx.Util
  
  @peso [6, 5, 4, 3, 2]

  def is_valid?(input) do
    l_ie = 
      input
      |> Util.only_numbers()
      |> Util.parse_ie()
    # extrai digito verificador
    [f_dig] = Util.get_digs(l_ie, 1)
    #
    rest_ie = 
      l_ie
      |> List.delete_at(-1)
      # remove os três primeiros digitos da IE
      |> List.delete_at(0)
      |> List.delete_at(0)
      |> List.delete_at(0)
    #
    resto =
      rest_ie
      |> Util.calc_peso(@peso)
      |> rem(11)

    dv = (11 - resto)
    dv = if (dv == 10 || dv == 11), do: (dv - 10), else: dv

    f_dig == dv
  end
end
