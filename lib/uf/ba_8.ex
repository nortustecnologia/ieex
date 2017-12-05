defmodule IEEx.UF.BA8 do
  alias IEEx.Util
  
  @peso1 [7, 6, 5, 4, 3, 2]
  @peso2 [8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)
    l_ie = Util.parse_ie(ie)
    
    # extrai dígito verificador
    [f_dig, s_dig] = Util.get_digs(l_ie, 2)

    rest_ie = 
      l_ie
      |> List.delete_at(-1)
      |> List.delete_at(-1)
    #
    if String.starts_with?(ie, ["6", "7", "9"]) do
      calc_mod_11(rest_ie, f_dig, s_dig)
    else
      calc_mod_10(rest_ie, f_dig, s_dig)
    end
  end

  defp calc_mod_10(ie, dv1, dv2) do
    # calculo segundo digito verificador
    second_dv =
      ie
      |> Util.calc_peso(@peso1)
      |> rem(10)

    second_dv = if second_dv == 0, do: 0, else: (10 - second_dv)

    # adiciona o dig. calculado a IE
    ie = List.insert_at(ie, -1, second_dv)

    # calculo do primeiro digito verificador
    first_dv =
      ie
      |> Util.calc_peso(@peso2)
      |> rem(10)

    first_dv = if first_dv == 0, do: 0, else: (10 - first_dv)

    first_dv == dv1 && second_dv == dv2
  end

  defp calc_mod_11(ie, dv1, dv2) do
    # calculo segundo digito verificador
    second_dv =
      ie
      |> Util.calc_peso(@peso1)
      |> rem(11)

    second_dv = if (second_dv > 1), do: (11 - second_dv), else: 0

    # adiciona o dig. calculado a IE
    ie = List.insert_at(ie, -1, second_dv)

    # calculo do primeiro digito verificador
    first_dv =
      ie
      |> Util.calc_peso(@peso2)
      |> rem(11)
      
    first_dv = if (first_dv > 1), do: (11 - first_dv), else: 0

    first_dv == dv1 && second_dv == dv2
  end
end
