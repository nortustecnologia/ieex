defmodule Util do
  @doc """
    retorna apenas os números da string passada como parametro
  """
  def only_numbers(value), do: String.replace(value, ~r/[^0-9]/, "")

  @doc """
    retorna uma lista com a quantidade de dígitos verificadores
    passada no parametro "amount".
  """
  def get_dv(value, amount) do
    result = []
  end

  def extract_ie(ie) do
    Enum.map(String.codepoints(ie), fn(x) -> String.to_integer(x) end)
  end
end
