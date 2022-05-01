defmodule FoodWeb.Router do
  use FoodWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", FoodWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:slug", PageController, :show
  end
end
