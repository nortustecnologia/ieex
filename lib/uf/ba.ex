defmodule BA do
  def is_valid?(input) do
    ie = Util.only_numbers(input)
    # 64038705 - falhando
    case String.length(ie) do
      8 -> BA8.is_valid? ie
      9 -> BA9.is_valid? ie
      _ -> false
    end
  end
end
