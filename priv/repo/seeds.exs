# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Food.Repo.insert!(%Food.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Food.Repo.delete_all(Food.Recipe)
Food.Repo.delete_all(Food.Ingredient)

Food.Admin.create_recipe(%{
  name: "Pizzateig",
  slug: "pizza",
  best: "Den besten Pizzateig",
  ingredients: [
    %{ name: "Wasser", amount: 125, unit: "ml" },
    %{ name: "Mehl", amount: 235, unit: "g" },
    %{ name: "Hefe", amount: 10, unit: "g" },
    %{ name: "Salz", amount: 7, unit: "g" },
    %{ name: "Olivenöl", amount: 10, unit: "ml" },
    %{ name: "Zucker", amount: 1, unit: "kleine Prise" }
  ]
})

Food.Admin.create_recipe(%{
  name: "Waffeln",
  slug: "waffeln",
  best: "Die besten Waffeln",
  ingredients: [
  ]
})

Food.Admin.create_recipe(%{
  name: "Pfannkuchen",
  slug: "pfannkuchen",
  best: "Die besten Pfannkuchen",
  ingredients: [
  ]
})

# Food.Admin.create_user(%{name: "Daniel Diekmeier", email: "danieldiekmeier@gmail.com", password: "geheim420"})
