defmodule Metex.MixProject do
  use Mix.Project

  def project do
    [
      app: :metex,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.9.0"},
      {:json, "~> 0.3.0"}
    ]
  end
end
