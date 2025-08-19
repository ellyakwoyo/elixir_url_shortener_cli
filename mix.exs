defmodule ElixirUrlShortenerCli.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_url_shortener_cli,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: [],
      escript: [main_module: UrlShortenerCli]
    ]

  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end
end
