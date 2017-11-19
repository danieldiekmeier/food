defmodule FoodWeb.AdminController do
  use FoodWeb, :controller

  def index(conn, _params) do
    case FoodWeb.Session.logged_in?(conn) do
      true ->
        recipes = Food.Admin.list_recipes
        render(conn, "index.html", recipes: recipes)
      false ->
        redirect conn, to: "/admin/login"
    end
  end
end
