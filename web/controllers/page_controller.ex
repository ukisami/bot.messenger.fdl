defmodule FdlMessengerBot.PageController do
  use FdlMessengerBot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def webhook(conn, _params) do
    render conn, "index.html"
  end
end
