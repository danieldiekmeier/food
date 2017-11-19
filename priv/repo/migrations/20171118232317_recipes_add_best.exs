defmodule Food.Repo.Migrations.RecipesAddBest do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :best, :string
    end
  end
end
