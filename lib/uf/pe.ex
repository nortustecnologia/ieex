defmodule PE do # 032141840
  import Util
  @peso1 [8, 7, 6, 5, 4, 3, 2]
  @peso2 [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = only_numbers(input)
    if String.length(ie) == 9 do
      dv1 = 0
      dv2 = 0
      # extrai digito verificador
      first_dv = String.to_integer(String.at(ie, -2))
      second_dv = String.to_integer(String.at(ie, -1))
      ie = extract_ie(ie) |> List.delete_at(-1) |> List.delete_at(-1)
      #
      resto =
        Enum.map_reduce(@peso1, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> rem(11)
      if (resto != 0 && resto != 1), do: dv1 = (11 - resto)

      ie = List.insert_at(ie, -1, dv1)
      #
      resto =
        Enum.map_reduce(@peso2, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> rem(11)
      if (resto != 0 && resto != 1), do: dv2 = (11 - resto)

      first_dv == dv1 && second_dv == dv2
    else
      false
    end
  end
end
