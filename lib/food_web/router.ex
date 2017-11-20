defmodule FoodWeb.Router do
  use FoodWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", FoodWeb do
    pipe_through :browser

    get "/", AdminController, :index

    get "/login", SessionController, :form
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout

    resources "/users", UserController
  end

  scope "/", FoodWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:slug", PageController, :show
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: FoodWeb.Schema

    forward "/", Absinthe.Plug,
      schema: FoodWeb.Schema
  end
end
