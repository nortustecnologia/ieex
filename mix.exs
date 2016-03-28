defmodule IEEx.Mixfile do
  use Mix.Project

  def project do
    [app: :ieex,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Biblioteca para validacao de Inscricao Estadual",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp package do
    [
     files: ["lib", "test", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Edmar Costa"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/edmaarcosta/IEEx"}
    ]
  end

  defp deps do
    []
  end
end
