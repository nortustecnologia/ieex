# IEEx

Biblioteca para validação de Inscrição Estadual em Elixir

## Instalação

O pacote pode ser instalado da seguinte forma:

  1. Adicione [IEEx](https://hex.pm/packages/ieex/0.0.1) a sua lista de dependência no arquivo `mix.exs`:

        def deps do
          [{:ieex, "~> 0.0.1"}]
        end

## Como usar?

Chamar explicitamente a função "is_valid?" do módulo "IEEx", passando
como parâmetro a inscrição estudual e a UF do estado que será validado.

Exemplo:
  - IEEx.is_valid?("332.88892-76", "pr")

Obs.: não importa se você informar a IE com caracteres especiais e/ou UF
em lowcase ou upcase, a biblioteca não vai considerar como as informações
foram passadas.

## TODO:
- Remover códigos repetidos.
- Validar IE sem informar UF (retornar um tuple com as UF válidas
  para IE informada)
