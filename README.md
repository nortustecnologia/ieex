# IEEx

Biblioteca para validação de Inscrição Estadual em Elixir

## Instalação

1. Adicione [IEEx](https://hex.pm/packages/ieex) a sua lista de dependência no arquivo `mix.exs`:

    ```elixir
    defmodule YourApp.Mixfile do
      defp deps do
        [
          {:ieex, "~> 0.0.4"}
        ]
      end
    end
    ```

2. Execute `mix deps.get` para instalar a biblioteca

## Uso

Chamar explicitamente a função `is_valid?` do módulo `IEEx`, passando
como parâmetro a inscrição estadual e a UF do estado que será validado.

### Exemplos

``` elixir
iex> IEEx.is_valid?("56456", "pr")
false

iex> IEEx.is_valid?("52.504.085/2-0", "pr")
true

iex> IEEx.is_valid?("1207580984", "PR")
true

```

Obs.: não importa se você informar a IE com caracteres especiais e/ou UF
em lowcase ou upcase, a biblioteca não vai considerar como as informações
foram passadas.

## Como contribuir?

1. Fork it
2. Crie um novo branch com suas mudanças (`git checkout -b my-new-feature`)
3. Commit suas mudanças (`git commit -am "Added some feature"`)
4. Push para o branch criado (`git push origin my-new-feature`)
5. Crie um novo pull request
