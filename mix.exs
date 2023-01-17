defmodule BanditNative.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :bandit_native,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Native functions for bandit",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler_precompiled, "~> 0.5"},
      {:rustler, ">= 0.0.0", optional: true}
    ]
  end

  defp package do
    [
      name: "bandit_native",
      maintainers: ["Kevin Seidel"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/moogle19/bandit_native"},
      files: ~w(.formatter.exs mix.exs README.md lib native checksum-*.exs)
    ]
  end
end
