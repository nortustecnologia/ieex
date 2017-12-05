defmodule IEEx.UF.GO do # 10.987.654-7
  alias IEEx.Util

  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if (String.length(ie) == 9) do
      case String.at(ie, 0)<>String.at(ie, 1)  do
        "10" -> check_ie(ie)
        "11" -> check_ie(ie)
        "15" -> check_ie(ie)
        _ -> false
      end
    else
      false
    end
  end

  defp check_ie(ie) do
    l_ie = Util.parse_ie(ie)
    [f_dig] = Util.get_digs(l_ie, 1)
    rest_ie = List.delete_at(l_ie, -1)
    #
    resto =
      rest_ie
      |> Util.calc_peso(@peso)
      |> rem(11)

    ie_join = String.to_integer(Enum.join(rest_ie))
    
    if ie_join == 11094402 do
      f_dig == 0 || f_dig == 1
    else
      dv = 
        cond do
          resto == 0 -> 0
          resto == 1 && (ie_join >= 10103105 && ie_join <= 10119997) -> 1
          resto == 1 -> 0
          true -> (11 - resto)
        end

      f_dig == dv
    end
  end
end
