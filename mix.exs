defmodule Esviewing.MixProject do
  use Mix.Project

  def project do
    [
      app: :esviewing,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:eventstore, :logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:commanded, "~> 0.18"},
      {:commanded_eventstore_adapter, "~> 0.5"},
      {:jason, "~> 1.1"}
    ]
  end
end
