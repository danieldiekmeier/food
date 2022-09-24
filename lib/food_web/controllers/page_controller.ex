defmodule FoodWeb.PageController do
  use FoodWeb, :controller

  def index(conn, _params) do
    recipes = Food.Page.list_recipes()
    render(conn, "index.html", recipes: recipes)
  end

  def show(conn, %{"slug" => slug}) do
    recipe = Food.Page.get_recipe!(slug)

    times =
      fetch_query_params(conn).query_params
      |> Map.get("times", "1")
      |> String.to_integer()

    render(conn, "recipe.html", recipe: recipe, times: times)
  end
end
