defmodule IEEx.UF.RS do # 224/3658792
  alias IEEx.Util
  
  @peso [2, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if String.length(ie) == 10 do
      l_ie = Util.parse_ie(ie)
      # extrai digito verificador
      [f_dig] = Util.get_digs(l_ie, 1)
      # 
      rest_ie = List.delete_at(l_ie, -1)
      #
      resto =
        rest_ie
        |> Util.calc_peso(@peso)
        |> rem(11)

      dv = (11 - resto)
      dv = if (dv == 10 || dv == 11), do: 0, else: dv

      f_dig == dv
    else
      false
    end
  end
end
