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

  def webhook(conn, %{
    "object": object,
    "entry": entry
  }) do
    page_access_token = System.get_env("FACEBOOK_PAGE_ACCESS_TOKEN")
    IO.inspect(entry)
    IO.inspect(entry["messaging"])
    IO.inspect(page_access_token)
    text conn, "hello"
  end
end
