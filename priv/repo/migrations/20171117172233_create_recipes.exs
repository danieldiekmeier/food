defmodule Food.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string
      add :slug, :string

      timestamps()
    end

    create index("recipes", [:slug], unique: true)
  end
end
