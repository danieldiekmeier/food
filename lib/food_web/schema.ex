defmodule FoodWeb.Schema do
  use Absinthe.Schema
  import_types FoodWeb.Schema.ContentTypes

  alias FoodWeb.Resolvers

  query do
    @desc "Get all recipes"
    field :recipes, list_of(:recipe) do
      resolve &Resolvers.Content.list_recipes/3
    end

    @desc "Get one recipe"
    field :recipe, :recipe do
      arg :slug, non_null(:string)
      resolve &Resolvers.Content.get_recipe/3
    end
  end
end
