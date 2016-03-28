defmodule IEEx do
  def is_valid?(ie, uf) do
    if is_nil(ie), do: ie = ""
    if is_nil(uf), do: uf = ""

    case String.upcase(uf) do
      "AC" -> AC.is_valid?(ie)
      "AL" -> AL.is_valid?(ie)
      "AM" -> AM.is_valid?(ie)
      "AP" -> AP.is_valid?(ie)
      "BA" -> BA.is_valid?(ie)
      "CE" -> CE.is_valid?(ie)
      "DF" -> DF.is_valid?(ie)
      "ES" -> ES.is_valid?(ie)
      "GO" -> GO.is_valid?(ie)
      "MA" -> MA.is_valid?(ie)
      "MG" -> MG.is_valid?(ie)
      "MS" -> MS.is_valid?(ie)
      "MT" -> MT.is_valid?(ie)
      "PA" -> PA.is_valid?(ie)
      "PB" -> PB.is_valid?(ie)
      "PE" -> PE.is_valid?(ie)
      "PI" -> PI.is_valid?(ie)
      "PR" -> PR.is_valid?(ie)
      "RJ" -> RJ.is_valid?(ie)
      "RN" -> RN.is_valid?(ie)
      "RO" -> RO.is_valid?(ie)
      "RR" -> RR.is_valid?(ie)
      "RS" -> RS.is_valid?(ie)
      "SC" -> SC.is_valid?(ie)
      "SE" -> SE.is_valid?(ie)
      "SP" -> SP.is_valid?(ie)
      "TO" -> TO.is_valid?(ie)
      _ -> false
    end
  end
end
