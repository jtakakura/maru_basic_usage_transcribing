defmodule MaruBasicUsageTranscribing.MixProject do
  use Mix.Project

  def project do
    [
      app: :maru_basic_usage_transcribing,
      version: "0.1.0",
      elixir: "~> 1.6",
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
      {:maru, "~> 0.11"},
      {:guardian, "~> 1.0"},
      {:xandra, ">= 0.0.0"},
      {:logger_file_backend, "~> 0.0.10"}
    ]
  end
end
