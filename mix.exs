defmodule Cart.MixProject do
  use Mix.Project

  def project do
    [
      app: :cart,
      version: "0.1.0",
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ecto, :postgrex],
      mod: {Cart.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {
        :ecto_sql,
        "~> 3.0"
      },
      {
        :postgrex,
        ">=0.0.0"
      }
    ]
  end
end
