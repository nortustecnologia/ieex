defmodule IEExTest do
  use ExUnit.Case
  doctest IEEx

  test "valid Acre" do
    assert AC.is_valid? "01.004.823/001-12"
    assert AC.is_valid? "0180873660999"
    assert AC.is_valid? "019.255.492.75-92"
  end

  test "invalid Acre" do
    refute AC.is_valid? ""
    refute AC.is_valid? "foo_bar"
    refute AC.is_valid? "174550316"
    refute AC.is_valid? "01.004.823/001-20"
    refute AC.is_valid? "09.004.823/001-12"
  end

  test "valid Alagoas" do
    assert AL.is_valid? "248521942"
    assert AL.is_valid? "2/48.78.891-4"
  end

  test "invalid Alagoas" do
    refute AL.is_valid? ""
    refute AL.is_valid? "foo_bar"
    refute AL.is_valid? "123789-"
    refute AL.is_valid? "248332930"
    refute AL.is_valid? "238521942"
  end

  test "valid Amapá" do
    assert AP.is_valid? "034238557"
    assert AP.is_valid? "03133-553-5"
  end

  test "invalid Amapá" do
    refute AP.is_valid? ""
    refute AP.is_valid? "foo bar"
    refute AP.is_valid? "038102856"
    refute AP.is_valid? "028111"
    refute AP.is_valid? "044238557"
  end

  test "valid Amazonas" do
    assert AM.is_valid? "34.514.391-4"
    assert AM.is_valid? "431191654"
    assert AM.is_valid? "9./3..8.2.4.-4/8+0-9--"
  end

  test "invalid Amazonas" do
    refute AM.is_valid? ""
    refute AM.is_valid? "foo_bar"
    refute AM.is_valid? "292421568"
    refute AM.is_valid? "6565"
    refute AM.is_valid? "78955646841"
  end

  test "valid Bahia" do
    assert BA.is_valid? "746217-24"
    assert BA.is_valid? "91997929"
    assert BA.is_valid? "5.1-6/8-1.27-0"
  end

  test "invalid Bahia" do
    refute BA.is_valid? ""
    refute BA.is_valid? "fooo_baar"
    refute BA.is_valid? "232190-66"
    refute BA.is_valid? "265868-26"
    refute BA.is_valid? "61482112390"
  end

  test "valid Ceará" do
    assert CE.is_valid? "99034728-1"
    assert CE.is_valid? "31.736.151-1"
    assert CE.is_valid? "023922095"
  end

  test "invalid Ceará" do
    refute CE.is_valid? ""
    refute CE.is_valid? "fooo_baar"
    refute CE.is_valid? "207951121"
    refute CE.is_valid? "2075744"
    refute CE.is_valid? "20757441283721"
  end

  test "valid Distrito Federal" do
    assert DF.is_valid? "07396125001-79"
    assert DF.is_valid? "0737849400167"
    assert DF.is_valid? "077.978.610-0/1-40"
  end

  test "invalid Distrito Federal" do
    refute DF.is_valid? ""
    refute DF.is_valid? "foo bar"
    refute DF.is_valid? "087.978.610-0/1-40"
    refute DF.is_valid? "0789236800399"
    refute DF.is_valid? "0731886900336"
  end

  test "valid Espírito Santo" do
    assert ES.is_valid? "793888840"
    assert ES.is_valid? "483.104.7/9-5"
  end

  test "invalid Espírito Santo" do
    refute ES.is_valid? ""
    refute ES.is_valid? "foooo_baaar"
    refute ES.is_valid? "615384155"
    refute ES.is_valid? "5839"
    refute ES.is_valid? "956500285095685"
  end

  test "valid Goiás" do
    assert GO.is_valid? "15.199.991-0"
    assert GO.is_valid? "110302974"
    assert GO.is_valid? "10.15.89.01-8"
  end

  test "invalid Goiás" do
    refute GO.is_valid? ""
    refute GO.is_valid? "foo bar"
    refute GO.is_valid? "163526725"
    refute GO.is_valid? "163672"
    refute GO.is_valid? "30584959848898"
  end

  test "valid Maranhão" do
    assert MA.is_valid? "12344838-7"
    assert MA.is_valid? "127256342"
    assert MA.is_valid? "12-4.301.52/5"
  end

  test "invalid Maranhão" do
    refute MA.is_valid? ""
    refute MA.is_valid? "foo bar"
    refute MA.is_valid? "12663806-4"
    refute MA.is_valid? "15079026-2"
  end

  test "valid Mato Grosso" do
    assert MT.is_valid? "5830833963-2"
    assert MT.is_valid? "53299114059"
    assert MT.is_valid? "66.781.215.66/0"
  end

  test "invalid Mato Grosso" do
    refute MT.is_valid? ""
    refute MT.is_valid? "foo bar"
    refute MT.is_valid? "86720209965"
    refute MT.is_valid? "000902563"
    refute MT.is_valid? "0237657333"
    refute MT.is_valid? "6588140975465687"
  end

  test "valid Mato Grosso do Sul" do
    assert MS.is_valid? "286205831"
    assert MS.is_valid? "28565891-3"
    assert MS.is_valid? "28.936.608/-9"
  end

  test "invalid Mato Grosso do Sul" do
    refute MS.is_valid? ""
    refute MS.is_valid? "foo bar"
    refute MS.is_valid? "28810304-0"
    refute MS.is_valid? "29508904-8-0"
    refute MS.is_valid? "275965727"
    refute MS.is_valid? "27596"
  end

  test "valid Pará" do
    assert PA.is_valid? "15-121985-0"
    assert PA.is_valid? "151992819"
    assert PA.is_valid? "15;13.01-40/9"
  end

  test "invalid Pará" do
    refute PA.is_valid? ""
    refute PA.is_valid? "foo bar"
    refute PA.is_valid? "160435444"
    refute PA.is_valid? "151664"
    refute PA.is_valid? "155940023890"
  end

  test "valid Minas Gerais" do
    assert MG.is_valid? "674.588.079/9345"
    assert MG.is_valid? "6024906343850"
    assert MG.is_valid? "62.30-3.81/17.00?5-5"
  end

  test "invalid Minas Gerais" do
    refute MG.is_valid? ""
    refute MG.is_valid? "foo bar"
    refute MG.is_valid? "1814698656100"
    refute MG.is_valid? "89048398"
    refute MG.is_valid? "890483984567887909890"
  end

  test "valid Paraíba" do
    assert PB.is_valid? "56452342-9"
    assert PB.is_valid? "926579487"
    assert PB.is_valid? "15.19.08.3/5-4"
  end

  test "invalid Paraíba" do
    refute PB.is_valid? ""
    refute PB.is_valid? "foo bar"
    refute PB.is_valid? "418090042"
    refute PB.is_valid? "7977210"
    refute PB.is_valid? "97675159589"
  end

  test "valid Paraná" do
    assert PR.is_valid? "1207580984"
    assert PR.is_valid? "226.91104-92"
    assert PR.is_valid? "52.504.085/2-0"
  end

  test "invalid Paraná" do
    refute PR.is_valid? ""
    refute PR.is_valid? "foo bar"
    refute PR.is_valid? "875.20300-20"
    refute PR.is_valid? "456.65629-"
    refute PR.is_valid? "93748689102"
  end

  test "valid Pernambuco" do
    assert PE.is_valid? "2145296-22"
    assert PE.is_valid? "094872473"
    assert PE.is_valid? "40.439.75-5/7"
  end

  test "invalid Pernambuco" do
    refute PE.is_valid? ""
    refute PE.is_valid? "foo bar"
    refute PE.is_valid? "4340909"
    refute PE.is_valid? "18293849283409"
    refute PE.is_valid? "796022667"
  end

  test "valid Piauí" do
    assert PI.is_valid? "57731496-3"
    assert PI.is_valid? "564024252"
    assert PI.is_valid? "7..1/58.87;34-3"
  end

  test "invalid Piauí" do
    refute PI.is_valid? ""
    refute PI.is_valid? "foo bar"
    refute PI.is_valid? "20764044-1"
    refute PI.is_valid? "8476714"
    refute PI.is_valid? "876101937120938"
  end

  test "valid Rio de Janeiro" do
    assert RJ.is_valid? "18.701.82-0"
    assert RJ.is_valid? "92359700"
    assert RJ.is_valid? "16/5.22;3-8-4"
  end

  test "invalid Rio de Janeiro" do
    refute RJ.is_valid? ""
    refute RJ.is_valid? "foo bar"
    refute RJ.is_valid? "05416654"
    refute RJ.is_valid? "1056413662354"
    refute RJ.is_valid? "1056454"
  end

  test "valid Rio Grande do Norte" do
    assert RN.is_valid? "20.849.500-2"
    assert RN.is_valid? "207763305"
    assert RN.is_valid? "20.161.2/86-0"
    assert RN.is_valid? "20.0.040.040-0"
  end

  test "invalid Rio Grande do Norte" do
    refute RN.is_valid? ""
    refute RN.is_valid? "foo bar"
    refute RN.is_valid? "20.112.101-6"
    refute RN.is_valid? "20.52.3-2"
    refute RN.is_valid? "201.581.947-58"
  end

  test "valid Rio Grande do Sul" do
    assert RS.is_valid? "070/8096522"
    assert RS.is_valid? "3269328984"
    assert RS.is_valid? "214/234.62-30"
  end

  test "invalid Rio Grande do Sul" do
    refute RS.is_valid? ""
    refute RS.is_valid? "foo bar"
    refute RS.is_valid? "2728651589"
    refute RS.is_valid? "089/408157819802"
    refute RS.is_valid? "08157819802"
  end

  test "valid Rondônia" do
    assert RO.is_valid? "8011548554016-0"
    assert RO.is_valid? "52827981579384"
    assert RO.is_valid? "7;547.948.887/225-1"
  end

  test "invalid Rondônia" do
    refute RO.is_valid? ""
    refute RO.is_valid? "foo bar"
    refute RO.is_valid? "53573110713564"
    refute RO.is_valid? "706258481554"
    refute RO.is_valid? "783275064225905648897"
  end

  test "valid Roraima" do
    assert RR.is_valid? "242518614"
    assert RR.is_valid? "24443456-7"
    assert RR.is_valid? "24.125/557-5"
  end

  test "invalid Roraima" do
    refute RR.is_valid? ""
    refute RR.is_valid? "foo bar"
    refute RR.is_valid? "244652786"
    refute RR.is_valid? "248458497897"
    refute RR.is_valid? "2453565"
  end

  test "valid Santa Catarina" do
    assert SC.is_valid? "374.366.640"
    assert SC.is_valid? "710390432"
    assert SC.is_valid? "27.69-58/48-9"
  end

  test "invalid Santa Catarina" do
    refute RR.is_valid? ""
    refute RR.is_valid? "foo bar"
    refute RR.is_valid? "120.979.056"
    refute RR.is_valid? "11505568888"
    refute RR.is_valid? "1194278"
  end

  test "valid São Paulo" do
    assert SP.is_valid? "879.503.980.415"
    assert SP.is_valid? "421755184500"
    assert SP.is_valid? "69.41-690-191-83"
  end

  test "invalid São Paulo" do
    refute SP.is_valid? ""
    refute SP.is_valid? "foo bar"
    refute SP.is_valid? "P701286490591"
    refute SP.is_valid? "708156887062"
    refute SP.is_valid? "751273890545460"
    refute SP.is_valid? "49599668"
  end

  test "valid Sergipe" do
    assert SE.is_valid? "52386202-4"
    assert SE.is_valid? "312744226"
    assert SE.is_valid? "05.685.261-4"
  end

  test "invalid Sergipe" do
    refute SE.is_valid? ""
    refute SE.is_valid? "foo bar"
    refute SE.is_valid? "74967630-0"
    refute SE.is_valid? "34588973"
    refute SE.is_valid? "69112956809"
  end

  test "valid Tocantins" do
    assert TO.is_valid? "4703910099-3"
    assert TO.is_valid? "39033065758"
    assert TO.is_valid? "6.503.737/190-4"
  end

  test "invalid Tocantins" do
    refute TO.is_valid? ""
    refute TO.is_valid? "foo bar"
    refute TO.is_valid? "2303892524-0"
    refute TO.is_valid? "86329416-1"
    refute TO.is_valid? "755563652211-2"
  end
end
