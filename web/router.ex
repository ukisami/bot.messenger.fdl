defmodule FdlMessengerBot.Router do
  use FdlMessengerBot.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FdlMessengerBot do
    pipe_through :api # Use the api stack

    get "/", PageController, :index
    get "/webhook/", PageController, :webhook
    post "/webhook/", PageController, :webhook
  end

  # Other scopes may use custom stacks.
  # scope "/api", FdlMessengerBot do
  #   pipe_through :api
  # end
end
