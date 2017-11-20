defmodule FoodWeb.Resolvers.Content do
  def list_recipes(_parent, _args, _resolution) do
    {:ok, Food.Page.list_recipes()}
  end

  def get_recipe(_parent, %{slug: slug}, _resolution) do
    case Food.Page.get_recipe!(slug) do
      nil ->
        {:error, "Recipe ID #{slug} not found"}
      recipe ->
        {:ok, recipe}
    end
  end
end
