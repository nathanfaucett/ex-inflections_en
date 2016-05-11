defmodule InflectionsEn do
    use Application
    use Supervisor

    def start(_type, _args) do
        en = Inflector.new()

            |> Inflector.plural(Regex.compile!("$", "i"), "s")
            |> Inflector.plural(Regex.compile!("([sxz]|[cs]h)$", "i"), "\\1es")
            |> Inflector.plural(Regex.compile!("([^aeiouy]o)$", "i"), "\\1es")
            |> Inflector.plural(Regex.compile!("([^aeiouy])y$", "i"), "\\1ies")

            |> Inflector.singular(Regex.compile!("s$", "i"), "")
            |> Inflector.singular(Regex.compile!("(ss)$", "i"), "$1")
            |> Inflector.singular(Regex.compile!("([sxz]|[cs]h)es$", "i"), "\\1")
            |> Inflector.singular(Regex.compile!("([^aeiouy]o)es$", "i"), "\\1")
            |> Inflector.singular(Regex.compile!("([^aeiouy])ies$", "i"), "\\1y")

            |> Inflector.irregular("child", "children")
            |> Inflector.irregular("person", "people")
            |> Inflector.irregular("self", "selves")
            |> Inflector.irregular("man", "men")
            |> Inflector.irregular("woman", "women")

            |> Inflector.uncountable("police")
            |> Inflector.uncountable("jeans")
            |> Inflector.uncountable("sheep")
            |> Inflector.uncountable("fish")
            |> Inflector.uncountable("series")
            |> Inflector.uncountable("species")
            |> Inflector.uncountable("money")
            |> Inflector.uncountable("rice")
            |> Inflector.uncountable("information")
            |> Inflector.uncountable("equipment")

        Inflections.set(:en, en)

        {:ok, self}
    end
end
