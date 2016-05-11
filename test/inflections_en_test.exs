defmodule InflectionsEnTest do
    use ExUnit.Case
    doctest InflectionsEn

    test "the truth" do
        inflector = Inflections.get(:en)

        assert Inflector.pluralize(inflector, "word") == "words"
        assert Inflector.pluralize(inflector, "kiss") == "kisses"
        assert Inflector.pluralize(inflector, "sky") == "skies"
        assert Inflector.pluralize(inflector, "box") == "boxes"

        assert Inflector.singularize(inflector, "kisses") == "kiss"
        assert Inflector.singularize(inflector, "words") == "word"
        assert Inflector.singularize(inflector, "skies") == "sky"
        assert Inflector.singularize(inflector, "boxes") == "box"
    end
end
