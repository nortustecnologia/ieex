defmodule RN10 do
  import Util
  @peso [10, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = input
    # extrai digito verificador
    first_dv = String.to_integer(String.at(ie, -1))
    ie = extract_ie(ie) |> List.delete_at(-1)
    #
    dv =
      Enum.map_reduce(@peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
        |> Tuple.to_list
        |> Enum.at(0)
        |> Enum.sum
        |> mult(10)
        |> rem(11)
    if (dv == 10), do: dv = 0

    first_dv == dv
  end

  defp mult(value, exp) do
    value * exp
  end
end
