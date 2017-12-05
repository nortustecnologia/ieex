defmodule IEEx.UF.RN do
  alias IEEx.Util
  alias IEEx.UF.RN9
  alias IEEx.UF.RN10

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if String.length(ie) > 0 && ((String.at(ie, 0)<>String.at(ie, 1)) == "20") do
      case String.length(ie) do
        9  -> RN9.is_valid?(ie)
        10 -> RN10.is_valid?(ie)
        _  -> false
      end
    else
      false
    end
  end
end
