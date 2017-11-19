defmodule FoodWeb.SessionController do
  use FoodWeb, :controller

  def form(conn, _params) do
    render conn, "form.html"
  end

  def login(conn, params) do
    case FoodWeb.Session.login(params, Food.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: "/admin")
      :error ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> redirect(to: "/admin/login")
    end
  end

  def logout(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/admin/login")
  end
end
