defmodule PhoenixOneFourWeb.Router do
  use PhoenixOneFourWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixOneFourWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/ps_demo", PushStateDemoLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixOneFourWeb do
  #   pipe_through :api
  # end
end
