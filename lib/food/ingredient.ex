defmodule Food.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset
  alias Food.Ingredient


  schema "ingredients" do
    field :amount, :integer
    field :name, :string
    field :unit, :string

    # field :recipe_id, :integer

    belongs_to :recipe, Food.Recipe

    timestamps()
  end

  @doc false
  def changeset(%Ingredient{} = ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name, :amount, :unit])
    |> validate_required([:name, :amount])
  end
end
