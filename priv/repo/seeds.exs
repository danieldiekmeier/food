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
    %{ name: "Salz", amount: 4, unit: "g" },
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

Food.Admin.create_recipe(%{
  name: "Zimtmuffins",
  slug: "zimtmuffins",
  best: "Die besten Zimtmuffins",
  instructions: """
    Backofen auf 190°C vorheizen.

    Mehl, Backpulver und Vanillezucker vermischen.

    Geschmolzene Butter mit 100g Zucker, Ei, Sahne und Milch vermengen.

    Trockene und nasse Zutaten zusammenfügen.

    In Förmchen geben.

    20 Minuten bei 190°C backen.
    """,
  ingredients: [
    %{ name: "Mehl", amount: 240, unit: "g" },
    %{ name: "Backpulver", amount: 2, unit: "Teelöffel" },
    %{ name: "Vanillezucker", amount: 1, unit: "Päckchen" },
    %{ name: "Geschmolzene Butter", amount: 80, unit: "g" },
    %{ name: "Zucker", amount: 100, unit: "g" },
    %{ name: "Ei", amount: 1, unit: nil },
    %{ name: "Saure Sahne", amount: 110, unit: "g" },
    %{ name: "Milch", amount: 60, unit: "ml" },
    %{ name: "Zimt", amount: 1, unit: " Esslöffel" }
  ]
})

Food.Admin.create_recipe(%{
  name: "Naan",
  slug: "naan",
  best: "Das beste Naan",
  instructions: """
    Das lauwarme Wasser in eine Schüssel geben und mit der Hefe und 1 Teelöffel Zucker bestreuen. Für 10-15 Minuten stehen lassen, bis es schaumig wird.

    In einer größeren Schüssel Mehl, restlichen Zucker, 1/2 Teelöffel Salz und Backpulver zusammengeben.

    Vermischen, dann eine Kuhle in der Mitte formen und die geschmolzene Butter, Joghurt, Schwarzkümmel und die Hefemischung hineingeben.

    Das ganze gut durchkneten. Es sollte ein sehr weicher Teig sein, aber sich trotzdem zu einem Ball formen lassen.

    In einer großen Schüssel für etwa eine Stunde gehen lassen, bis sich die Größe verdoppelt hat.

    Mit Mehl flach ausrollen und in einer Pfanne von beiden Seiten ohne Öl braten. Anschließend mit Öl bestreichen (Olivenöl klappt gut).
    """,
  ingredients: [
    %{ name: "Trockenhefe", amount: 7, unit: "g" },
    %{ name: "Lauwarmes Wasser", amount: 125, unit: "ml" },
    %{ name: "Salz", amount: 0.5, unit: "Teelöffel" },
    %{ name: "Brauner Zucker", amount: 2, unit: "Teelöffel" },
    %{ name: "Mehl", amount: 300, unit: "g" },
    %{ name: "Backpulver", amount: 0.5, unit: "Teelöffel" },
    %{ name: "Geschmolzene Butter", amount: 25, unit: "g" },
    %{ name: "Naturjoghurt", amount: 150, unit: "ml" },
    %{ name: "Schwarzkümmel", amount: 1, unit: "Esslöffel" }
  ]
})

# Food.Admin.create_user(%{name: "Daniel Diekmeier", email: "danieldiekmeier@gmail.com", password: "geheim420"})
