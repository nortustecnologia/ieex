defmodule RN10 do
  @peso [10, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    l_ie = 
      input
      |> Util.only_numbers()
      |> Util.parse_ie()
    # extrai digito verificador
    [f_dig] = Util.get_digs(l_ie, 1)
    # 
    rest_ie = List.delete_at(l_ie, -1)
    #
    resto =
      rest_ie
      |> Util.calc_peso(@peso)
      |> mult(10)
      |> rem(11)

    dv = if (resto == 10), do: 0, else: resto
    
    f_dig == dv
  end

  defp mult(value, exp) do
    value * exp
  end
end
