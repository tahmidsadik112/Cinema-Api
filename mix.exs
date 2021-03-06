defmodule CinemaApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cinema_api,
      version: "0.0.1",
      elixir: ">= 1.6.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {CinemaApi.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.15"},
      {:cowboy, "~> 2.0"},
      {:httpoison, "~> 1.2"},
      {:floki, ">= 0.20.3"},
      {:credo, "~> 0.9.3", only: [:dev, :test], runtime: false},
      {:postgrex, "~> 0.14.1"},
      {:ecto_sql, "~> 3.0"},
      {:phoenix_ecto, "~> 4.0"},
      {:jason, "~> 1.0"},
      {:dialyxir, "~> 1.0.0-rc.3", only: [:dev], runtime: false},
      {:plug_cowboy, "~> 2.0"},
      {:plug, "~> 1.7"},
      {:distillery, "~> 2.0"},
      {:timex, "~> 3.1"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
