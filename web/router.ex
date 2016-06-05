defmodule FdlMessengerBot.Router do
  use FdlMessengerBot.Web, :router

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

  scope "/", FdlMessengerBot do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/webhook/", PageController, :webhook
    post "/webhook/", PageController, :webhook
  end

  # Other scopes may use custom stacks.
  # scope "/api", FdlMessengerBot do
  #   pipe_through :api
  # end
end
