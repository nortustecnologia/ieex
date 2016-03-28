defmodule CE do
  import Util

  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = only_numbers(input)

    if String.length(ie) == 9 do
      # digito verificador
      first_digs = String.to_integer(String.at(ie, -1))
      # transforma a IE em uma lista de inteiros
      ie = Enum.map(String.codepoints(ie), fn(x) -> String.to_integer(x) end)
      # remove o ultimo dígito
      ie = ie |> List.delete_at(-1)

      digs =
        Enum.map_reduce(@peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> rem(11)
          |> calc_mod_11

      first_digs == digs
    end
  end

  defp calc_mod_11(value) do
    result = (11 - value)
    if (result == 10 || result == 11), do: 0, else: result
  end
end
