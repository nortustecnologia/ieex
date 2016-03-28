defmodule SP do
  def is_valid?(input) do
    ie = Util.only_numbers(input)
    if String.length(ie) == 12 do
      case String.at(input, 0) do
        "P" -> SPP.is_valid? ie
        _ -> SP12.is_valid? ie
      end
    else
      false
    end
  end
end
