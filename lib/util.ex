defmodule Util do
  @doc """
  Retorna apenas os números da string passada como parametro
  """
  def only_numbers(value), do: String.replace(value, ~r/[^0-9]/, "")

  @doc """
  Retorna uma lista com os ultimos dígitos verificadores respeitando a 
  quantidade passada no parametro "amount"
  """
  def get_digs(list, amount) when is_list(list) do
    Enum.take(list, amount * -1)
  end

  @doc """
  Converte a inscrição estadual de string para uma lista de inteiros
  """
  def parse_ie(ie) do
    Enum.map(String.codepoints(ie), &String.to_integer(&1))
  end

  def extract_ie(ie) do
    Enum.map(String.codepoints(ie), &String.to_integer(&1))
  end

  @doc """
  Calcula o peso de cada digito da inscrição estadual dado os parâmetros

  Resulta em um inteiro que é a soma do calculo do peso
  
  """
  def calc_peso(ie, peso) when is_list(ie) and is_list(peso) do
    Enum.map_reduce(peso, 0, fn(x, idx) -> 
      {x * Enum.at(ie, idx), 1 + idx}
    end)
    |> Tuple.to_list()
    |> Enum.at(0)
    |> Enum.sum()
  end
end
