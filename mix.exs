defmodule Swarming.MixProject do
  use Mix.Project

  def project do
    [
      app: :swarming,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :eex, :wx, :observer, :runtime_tools, :libring],
      mod: {Swarming.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:libcluster, "~> 3.4"},
      {:cloister, "~> 0.13"},
      {:horde, "~> 0.8.5"},
      {:swarm_dynamic_supervisor, "~> 0.1.0"},
      {:swarm, "~> 3.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
