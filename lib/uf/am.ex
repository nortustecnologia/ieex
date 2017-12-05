defmodule IEEx.UF.AM do
  alias IEEx.Util

  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do # 05.202.722-8 - 052027228
    ie = Util.only_numbers(input)

    if String.length(ie) == 9 do
      l_ie = Util.parse_ie(ie)
      # digito verificador
      [f_dig] = Util.get_digs(l_ie, 1)
      # remove o ultimo dígito
      rest_ie = List.delete_at(l_ie, -1)

      result_sum = Util.calc_peso(rest_ie, @peso)

      if result_sum < 11 do
        f_dig == 11 - result_sum
      else
        mod = rem(result_sum, 11)
        
        if mod <= 1, do: f_dig == 0, else: f_dig == 11 - mod
      end
    else
      false
    end
  end
end
