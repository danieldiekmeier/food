defmodule FoodWeb.PageView do
  use FoodWeb, :view

  def markdown(body) do
    body
    |> Earmark.to_html
    |> raw
  end

  def format_amount(amount) do
    rounded = Float.round(amount)

    case amount do
      amount when amount == rounded ->
        Kernel.trunc(amount)
      0.5 ->
        "½"
      0.25 ->
        "¼"
      _ ->
        amount
    end
  end
end
