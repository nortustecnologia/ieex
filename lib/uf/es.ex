defmodule ES do
  import Util

  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = only_numbers(input)
    if String.length(ie) == 9 do
      # extrai o digito verificador da IE
      first_dv = String.to_integer(String.at(ie, -1))
      #
      ie = extract_ie(ie) |> List.delete_at(-1)
      dv =
        Enum.map_reduce(@peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> rem(11)
      if dv < 2, do: dv = 0, else: dv = (11 - dv)

      first_dv == dv
    else
      false
    end
  end
end