defmodule Food.Repo.Migrations.RecipesAddInstructions do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :instructions, :text
    end
  end
end
