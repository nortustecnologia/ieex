defmodule AM do
  import Util

  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do # 05.202.722-8 - 052027228
    ie = only_numbers(input)

    if String.length(ie) == 9 do
      # digito verificador
      first_digs = String.to_integer(String.at(ie, -1))
      # transforma a IE em uma lista de inteiros
      ie = Enum.map(String.codepoints(ie), fn(x) -> String.to_integer(x) end)
      # remove o ultimo dígito
      ie = ie |> List.delete_at(-1)

      result_sum =
        Enum.map_reduce(@peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum

      if result_sum < 11 do
        first_digs == 11 - result_sum
      else
        mod = rem(result_sum, 11)
        if mod <= 1, do: first_digs ==  0, else: first_digs ==  11 - mod
      end
    else
      false
    end
  end
end
