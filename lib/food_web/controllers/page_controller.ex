defmodule FoodWeb.PageController do
  use FoodWeb, :controller

  def index(conn, _params) do
    recipes = Food.Page.list_recipes
    render conn, "index.html", recipes: recipes
  end

  def show(conn, %{"slug" => slug}) do
    recipe = Food.Page.get_recipe!(slug)
    render conn, "recipe.html", recipe: recipe
  end
end
