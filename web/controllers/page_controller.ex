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

  def webhook(conn, %{"entry" => entry}) do
    messaging = hd(hd(entry)["messaging"])
    message = messaging["message"]["text"]
    user_id = messaging["sender"]["id"]

    FdlMessengerBot.MessengerAPI.start
    FdlMessengerBot.MessengerAPI.postMessage(%{:user_id => user_id, :message => message})
    text conn, :ok
  end
end
