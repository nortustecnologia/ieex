defmodule RR do
  import Util
  @peso [1, 2, 3, 4, 5, 6, 7, 8]

  def is_valid?(input) do
    ie = only_numbers(input)
    if String.length(ie) == 9 && ((String.at(ie, 0)<>String.at(ie, 1)) == "24") do
      # extrai digito verificador
      first_dv = String.to_integer(String.at(ie, -1))
      ie = extract_ie(ie) |> List.delete_at(-1)
      #
      dv =
        Enum.map_reduce(@peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> rem(9)

      first_dv == dv
    else
      false
    end
  end
end
