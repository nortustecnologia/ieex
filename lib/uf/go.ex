defmodule GO do # 10.987.654-7
  import Util
  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = only_numbers(input)
    if (String.length(ie) == 9) do
      case String.at(ie, 0)<>String.at(ie, 1)  do
        "10" -> check_ie(ie)
        "11" -> check_ie(ie)
        "15" -> check_ie(ie)
        _ -> false
      end
    else
      false
    end
  end

  defp check_ie(ie) do
    # extrai o digito verificador da IE
    first_dv = String.to_integer(String.at(ie, -1))
    ie = extract_ie(ie) |> List.delete_at(-1)
    #
    resto =
      Enum.map_reduce(@peso, 0, fn(x, idx) -> {x * Enum.at(ie, idx), 1 + idx} end)
        |> Tuple.to_list
        |> Enum.at(0)
        |> Enum.sum
        |> rem(11)

    ie = String.to_integer(Enum.join(ie))
    if ie == 11094402 do
      first_dv == 0 || first_dv == 1
    else
      if (resto == 0), do: dv = 0
      if (resto == 1 && (ie >= 10103105 && ie <= 10119997)), do: dv = 1, else: if resto == 1, do: dv = 0
      if (resto != 1 && resto != 0), do: dv = (11 - resto)

      first_dv == dv
    end
  end
end
