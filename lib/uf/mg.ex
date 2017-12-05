defmodule IEEx.UF.MG do
  alias IEEx.Util
  
  @peso1 [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2]
  @peso2 [3, 2, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    # se falta um algoritmo, completa com zero na posição 3
    ie = 
      if String.length(ie) == 13 do
        String.slice(ie, 0, 3)<>"0"<>String.slice(ie, 3, 20)
      else
        ie
      end

    if String.length(ie) == 14 do
      l_ie = Util.parse_ie(ie)
      # extrai digito verificador
      [f_dig, s_dig] = Util.get_digs(l_ie, 2)
      # remove digitos verificadores
      rest_ie = 
        l_ie 
        |> List.delete_at(-1) 
        |> List.delete_at(-1)

      dv1 =
        Enum.map_reduce(@peso1, 0, fn(x, idx) -> 
          {x * Enum.at(rest_ie, idx), 1 + idx} 
        end)
        |> Tuple.to_list()
        |> Enum.at(0)
        |> Enum.join()
        |> Util.parse_ie()
        |> Enum.sum()
        |> get_first_dv()

      # remove o digito 0 que foi inserido anteriormente e acrescente o digito calculado
      rest_ie = 
        rest_ie 
        |> List.delete_at(3) 
        |> List.insert_at(-1, dv1)

      resto =
        rest_ie
        |> Util.calc_peso(@peso2)
        |> rem(11)

      dv2 = if (resto == 1 || resto == 0), do: 0, else: (11 - resto)

      f_dig == dv1 && s_dig == dv2
    else
      false
    end
  end

  defp get_first_dv(value) do
    String.to_integer(:erlang.float_to_binary((Float.ceil(value / 10) * 10) - value, [decimals: 0]))
  end
end
