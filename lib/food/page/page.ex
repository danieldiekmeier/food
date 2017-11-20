defmodule Food.Page do
  import Ecto.Query, warn: false
  alias Food.Repo

  alias Food.Recipe

  @doc """
  Returns the list of recipes.

  ## Examples

      iex> list_recipes()
      [%Recipe{}, ...]

  """
  def list_recipes do
    Repo.all(Recipe)
    |> Repo.preload(:ingredients)
  end

  def get_recipe!(slug) do
    Repo.get_by!(Recipe, slug: slug)
    |> Repo.preload(:ingredients)
  end
end
