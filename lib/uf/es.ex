defmodule ES do
  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if String.length(ie) == 9 do
      l_ie = Util.parse_ie(ie)
      # extrai o digito verificador da IE
      [f_dig] = Util.get_digs(l_ie, 1)
      # 
      rest_ie = List.delete_at(l_ie, -1)
      
      resto =
        rest_ie
        |> Util.calc_peso(@peso)
        |> rem(11)

      dv = if resto < 2, do: 0, else: (11 - resto)

      f_dig == dv
    else
      false
    end
  end
end
