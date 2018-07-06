defmodule ExCompose.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_compose,
      name: "ExCompose",
      version: "0.2.0",
      description: "A library for composing XLSX files based off templates, with full support of template styling.",
      package: [
        name: "ex_compose",
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/Seiyial/ExCompose"},
        maintainers: ["Seiyial"]
      ],
      source_url: "https://github.com/Seiyial/ExCompose",
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
      {:ex_doc, "~> 0.14", only: :dev}
    ]
  end
end
