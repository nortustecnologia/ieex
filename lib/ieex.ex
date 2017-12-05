defmodule IEEx do
  @moduledoc """
  Valida a inscrição estadual com base na UF.

  ## Exemplos

      iex> IEEx.is_valid?("56456", "pr")
      false

      iex> IEEx.is_valid?("52.504.085/2-0", "pr")
      true

      iex> IEEx.is_valid?("1207580984", "PR")
      true

  """
  
  alias IEEx.UF.{AC, AL, AM, AP, BA, CE, DF, ES, GO, MA, MG, 
    MS, MT, PA, PB, PE, PI, PR, RJ, RN, RO, RR, RS, SC, SE, SP, TO}

  @doc """
  Verifica se a `ie` é válida para a `uf` informada.

  ## Exemplos

      iex> IEEx.is_valid?("56456", "pr")
      false

      iex> IEEx.is_valid?("52.504.085/2-0", "pr")
      true

      iex> IEEx.is_valid?("1207580984", "PR")
      true
      
  """
  def is_valid?(nil, _), do: false
  def is_valid?(_, nil), do: false
  def is_valid?("", _), do: false
  def is_valid?(_, ""), do: false
  def is_valid?(ie, uf) do
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
