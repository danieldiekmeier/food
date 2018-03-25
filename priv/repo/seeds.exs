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
  instructions: "Ich backe die Pizza am liebsten für **8 bis 10 Minuten bei 290°C**, weil sie dann außen schön knusprig wird. Man bekommt aber auch bei 200°C schöne Ergebnisse, dann backe ich sie ein paar Minuten länger.",
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
    %{ name: "Butter", amount: 125, unit: "g" },
    %{ name: "Zucker", amount: 70, unit: "g" },
    %{ name: "Eier", amount: 2, unit: nil },
    %{ name: "Mehl", amount: 175, unit: "g" },
    %{ name: "Vanillezucker", amount: 0.5, unit: "Päckchen" },
    %{ name: "Backpulver", amount: 0.25, unit: "Päckchen" },
    %{ name: "Milch", amount: 100, unit: "ml" }
  ]
})

Food.Admin.create_recipe(%{
  name: "Pfannkuchen",
  slug: "pfannkuchen",
  best: "Die besten Pfannkuchen",
  ingredients: [
    %{ name: "Eier", amount: 1, unit: nil },
    %{ name: "Mehl", amount: 133, unit: "g" },
    %{ name: "Milch", amount: 250, unit: "ml" },
    %{ name: "Salz", amount: 1, unit: "kleine Prise" },
    %{ name: "Zucker", amount: 2, unit: "Esslöffel" },
    %{ name: "Vanillezucker", amount: 1, unit: "Päckchen" },
    %{ name: "Vanillearoma", amount: 1, unit: "Päckchen" }
  ]
})

Food.Admin.create_recipe(%{
  name: "Käsekuchen (ohne Mehl)",
  slug: "kaesekuchen",
  best: "Den besten Käsekuchen",
  instructions: "Bei 150°C etwa 50 Minuten backen.",
  ingredients: [
    %{ name: "Quark", amount: 1000, unit: "g" },
    %{ name: "weiche Butter", amount: 200, unit: "g" },
    %{ name: "Eier", amount: 4, unit: nil },
    %{ name: "Vanillezucker", amount: 2, unit: "Päckchen" },
    %{ name: "Zucker", amount: 200, unit: "g" },
    %{ name: "Puddingpulver mit Vanillegeschmack", amount: 1, unit: "Packung" }
  ]
})

# Food.Admin.create_user(%{name: "Daniel Diekmeier", email: "danieldiekmeier@gmail.com", password: "geheim420"})
