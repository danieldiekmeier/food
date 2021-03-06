defmodule Food.Recipe do
  use Ecto.Schema
  import Ecto.Changeset
  alias Food.Recipe

  schema "recipes" do
    field :name, :string
    field :slug, :string
    field :best, :string
    field :instructions, :string

    has_many :ingredients, Food.Ingredient, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(%Recipe{} = recipe, attrs) do
    recipe
    |> cast(attrs, [:name, :slug, :best, :instructions])
    |> validate_required([:name, :slug, :best])
  end

  def create_changeset(%Recipe{} = recipe, attrs) do
    recipe
    |> changeset(attrs)
    |> cast_assoc(:ingredients)
  end
end
