defmodule BA9 do
  import Util

  @peso1 [8, 7, 6, 5, 4, 3, 2]
  @peso2 [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = only_numbers(input)
    # extrai dígito verificador
    first_dv = String.to_integer(String.at(ie, -2))
    second_dv = String.to_integer(String.at(ie, -1))
    #
    ie = extract_ie(ie) |> List.delete_at(-1) |> List.delete_at(-1)
    case String.at(ie, 1) do
      "6" -> calc_mod_11(ie, first_dv, second_dv)
      "7" -> calc_mod_11(ie, first_dv, second_dv)
      "9" -> calc_mod_11(ie, first_dv, second_dv)
      _ -> calc_mod_10(ie, first_dv, second_dv)
    end
  end

  defp calc_mod_10(ie, dv1, dv2) do
    # calculo segundo digito verificador
    second_dv =
      Enum.map_reduce(@peso1, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
        |> Tuple.to_list
        |> Enum.at(0)
        |> Enum.sum
        |> rem(10)
    unless second_dv == 0, do: second_dv = (10 - second_dv)

    # adiciona o dig. calculado a IE
    ie = List.insert_at(ie, -1, second_dv)
    # calculo do primeiro digito verificador
    first_dv =
      Enum.map_reduce(@peso2, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
        |> Tuple.to_list
        |> Enum.at(0)
        |> Enum.sum
        |> rem(10)
    unless first_dv == 0, do: first_dv = (10 - first_dv)

    first_dv == dv1 && second_dv == dv2
  end

  defp calc_mod_11(ie, dv1, dv2) do
    # calculo segundo digito verificador
    second_dv =
      Enum.map_reduce(@peso1, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
        |> Tuple.to_list
        |> Enum.at(0)
        |> Enum.sum
        |> rem(11)
    if (second_dv > 1), do: second_dv = (11 - second_dv), else: second_dv = 0

    # adiciona o dig. calculado a IE
    ie = List.insert_at(ie, -1, second_dv)
    # calculo do primeiro digito verificador
    first_dv =
      Enum.map_reduce(@peso2, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
        |> Tuple.to_list
        |> Enum.at(0)
        |> Enum.sum
        |> rem(11)
    if (first_dv > 1), do: first_dv = (11 - first_dv), else: first_dv = 0

    first_dv == dv1 && second_dv == dv2
  end
end
