defmodule IEEx.Util do
  @moduledoc """
  Módulo útil com funções comuns para o calculo e manipulação da inscrição estadual
  """

  @doc """
  Extrai apenas os números da string `value`

  ## Exemplos

      iex> only_numbers("654-98654-65/10")
      "654986546510"

      iex> only_numbers("P654D98654R65J10")
      "654986546510"

  """
  def only_numbers(value), do: String.replace(value, ~r/[^0-9]/, "")

  @doc """
  Retorna uma lista com os ultimos dígitos verificadores respeitando a 
  quantidade passada no parametro `amount`

  ## Exemplos

      iex> get_digs([1, 2, 3, 4, 5, 6], 2)
      [5, 6]

      iex> get_digs([1, 2, 3, 4, 5, 6], 1)
      [6]

  """
  def get_digs(list, amount) when is_list(list) do
    Enum.take(list, amount * -1)
  end

  @doc """
  Converte a inscrição estadual de string para uma lista de inteiros

  ## Exemplos

      iex> parse_ie("56465546")
      [5, 6, 4, 6, 5, 5, 4, 6]

  """
  def parse_ie(ie) do
    Enum.map(String.codepoints(ie), &String.to_integer(&1))
  end

  @doc """
  Multiplica o peso com cada digito da inscrição estadual dado os parâmetros.

  Resulta em um inteiro que é a soma dos produtos.
  
  ## Exemplos

      iex> calc_peso([5, 6, 4, 5, 2], [9, 8, 7, 6, 5])
      161
      
  """
  def calc_peso(ie, peso) when is_list(ie) and is_list(peso) do
    {result, _} =
      Enum.map_reduce(peso, 0, fn(x, idx) -> 
        {x * Enum.at(ie, idx), 1 + idx}
      end)
    
    Enum.sum(result)
  end
end
