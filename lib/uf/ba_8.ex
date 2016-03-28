defmodule BA8 do
  import Util
  require IEx

  @peso1 [7, 6, 5, 4, 3, 2]
  @peso2 [8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = only_numbers(input)
    # extrai dígito verificador
    first_digs = String.to_integer(String.at(ie, -2))
    second_digs = String.to_integer(String.at(ie, -1))
    #
    if String.starts_with?(ie, ["6", "7", "9"]) do
      ie = extract_ie(ie) |> List.delete_at(-1) |> List.delete_at(-1)
      calc_mod_11(ie, first_digs, second_digs)
    else
      ie = extract_ie(ie) |> List.delete_at(-1) |> List.delete_at(-1)
      calc_mod_10(ie, first_digs, second_digs)
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
    first_dv = (10 - first_dv)

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
