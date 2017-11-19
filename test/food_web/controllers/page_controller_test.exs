defmodule FoodWeb.PageControllerTest do
  use FoodWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Daniels Rezepte"
  end
end
