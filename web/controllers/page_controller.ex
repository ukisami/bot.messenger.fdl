defmodule FdlMessengerBot.PageController do
  use FdlMessengerBot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def webhook(conn, %{
    "hub.verify_token" => verify_token,
    "hub.challenge" => challenge
  }) do
    text conn, challenge
  end


end
