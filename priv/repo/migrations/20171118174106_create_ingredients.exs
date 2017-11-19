defmodule Food.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :name, :string
      add :amount, :float
      add :unit, :string
      add :recipe_id, references("recipes", on_delete: :delete_all)

      timestamps()
    end
  end
end
