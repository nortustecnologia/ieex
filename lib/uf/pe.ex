defmodule IEEx.UF.PE do # 032141840
  alias IEEx.Util

  alias IEEx.UF.PE9
  alias IEEx.UF.PE14

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    case String.length(ie) do
      9  -> PE9.is_valid?(ie)
      14 -> PE14.is_valid?(ie)
      _  -> false
    end
  end
end
