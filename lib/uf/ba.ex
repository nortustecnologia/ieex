defmodule IEEx.UF.BA do
  alias IEEx.Util
  alias IEEx.UF.BA8
  alias IEEx.UF.BA9
  
  def is_valid?(input) do
    ie = Util.only_numbers(input)
    
    case String.length(ie) do
      8 -> BA8.is_valid? ie
      9 -> BA9.is_valid? ie
      _ -> false
    end
  end
end
