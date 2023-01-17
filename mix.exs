defmodule BanditNative.MixProject do
  use Mix.Project

  def project do
    [
      app: :bandit_native,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:rustler, "~> 0.27"},
      {:rustler_precompiled, "~> 0.5"}
    ]
  end
end
