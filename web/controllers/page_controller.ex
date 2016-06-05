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
    page_access_token = System.get_env("FACEBOOK_PAGE_ACCESS_TOKEN")
    IO.inspect(entry)
    messaging = hd(entry)["messaging"]
    message = hd(messaging)["message"]["text"]
    user_id = messaging["sender"]["id"]
    IO.inspect(page_access_token)
    IO.inspect(message)
    MessengerAPI.start
    FdlMessengerBot.MessengerAPI.start
    FdlMessengerBot.MessengerAPI.postMessage(%{:user_id => user_id, :message => message})
    text conn, :ok
  end
end
