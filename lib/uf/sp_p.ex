defmodule SPP do
  import Util
  @peso [1, 3, 4, 5, 6, 7, 8, 10]

  def is_valid?(input) do
    # extrai digito verificador
    first_dv = String.to_integer(String.at(input, 8))
    # divide a inscrição estadual em duas partes
    ie = extract_ie(input) |> Enum.slice(0..7)
    #
    dv1 =
      Enum.map_reduce(@peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
        |> Tuple.to_list
        |> Enum.at(0)
        |> Enum.sum
        |> rem(11)
        |> Integer.to_string
        |> String.at(-1)
        |> String.to_integer

    first_dv == dv1
  end
end
