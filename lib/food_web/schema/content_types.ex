defmodule FoodWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :recipe do
    field :id, :id
    field :name, :string
    field :slug, :string
    field :ingredients, list_of(:ingredient)
  end

  object :ingredient do
    field :id, :id
    field :name, :string
    field :amount, :float
    field :unit, :string
  end
end
