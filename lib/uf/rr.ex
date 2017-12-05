defmodule IEEx.UF.RR do
  alias IEEx.Util
  
  @peso [1, 2, 3, 4, 5, 6, 7, 8]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if String.length(ie) == 9 && ((String.at(ie, 0)<>String.at(ie, 1)) == "24") do
      l_ie = Util.parse_ie(ie)
      # extrai digito verificador
      [f_dig] = Util.get_digs(l_ie, 1)
      # 
      rest_ie = List.delete_at(l_ie, -1)
      #
      dv =
        rest_ie
        |> Util.calc_peso(@peso)
        |> rem(9)

      f_dig == dv
    else
      false
    end
  end
end
