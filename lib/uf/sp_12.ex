defmodule SP12 do # 110042490114 - 0 e 4 são digitos verificadores
  import Util
  @peso1 [1, 3, 4, 5, 6, 7, 8, 10]
  @peso2 [3, 2, 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    # extrai digito verificador
    first_dv = String.to_integer(String.at(input, 8))
    second_dv = String.to_integer(String.at(input, -1))
    # divide a inscrição estadual em duas partes
    first_ie = extract_ie(input) |> Enum.slice(0..7)
    second_ie = extract_ie(input) |> Enum.slice(9..11)
    #
    dv1 =
      Enum.map_reduce(@peso1, 0, fn(x, idx) -> {x * Enum.at(first_ie, idx), 1 + idx} end)
        |> Tuple.to_list
        |> Enum.at(0)
        |> Enum.sum
        |> rem(11)
        |> Integer.to_string
        |> String.at(-1)
        |> String.to_integer
    # adiciona o digito calculado na IE e concatena a segunda lista para o calc.
    new_ie = Enum.concat(List.insert_at(first_ie, -1, dv1), second_ie)

    dv2 =
      Enum.map_reduce(@peso2, 0, fn(x, idx) -> {x * Enum.at(new_ie, idx), 1 + idx} end)
        |> Tuple.to_list
        |> Enum.at(0)
        |> Enum.sum
        |> rem(11)
        |> Integer.to_string
        |> String.at(-1)
        |> String.to_integer

    first_dv == dv1 && second_dv == dv2
  end
end
