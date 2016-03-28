defmodule MG do
  import Util
  @peso1 [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2]
  @peso2 [3, 2, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = only_numbers(input)
    # se falta um algoritmo, completa com zero na posição 3
    if String.length(ie) == 13, do: ie = String.slice(ie, 0, 3)<>"0"<>String.slice(ie, 3, 20)

    if String.length(ie) == 14 do
      # extrai digito verificador
      first_dv = String.to_integer(String.at(ie, -2))
      second_dv = String.to_integer(String.at(ie, -1))
      ie = extract_ie(ie) |> List.delete_at(-1) |> List.delete_at(-1)

      dv1 =
        Enum.map_reduce(@peso1, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.join
          |> extract_ie
          |> Enum.sum
          |> get_first_dv

      # remove o digito 0 que foi inserido anteriormente e acrescente o digito
      ie = List.delete_at(ie, 3) |> List.insert_at(-1, dv1)

      dv2 = 0
      resto =
        Enum.map_reduce(@peso2, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
          |> Tuple.to_list
          |> Enum.at(0)
          |> Enum.sum
          |> rem(11)
      if (resto != 1 && resto != 0), do: dv2 = (11 - resto)

      first_dv == dv1 && second_dv == dv2
    else
      false
    end
  end

  defp get_first_dv(value) do
    String.to_integer(Float.to_string((Float.ceil(value / 10) * 10) - value, [decimals: 0]))
  end
end
