defmodule FdlMessengerBot.MessengerAPI do
  use HTTPoison.Base

  def process_url(endpoint) do
    api_url(endpoint)
  end

  def process_request_headers(headers) do
    [{"content-type", "application/json"} | headers]
  end

  def postMessage(%{:user_id => user_id, :message => message}) do
    post("messages", [{"recipient", [{"id", user_id}]}, {"message", []}])
  end

  defp api_url(endpoint) do
    "https://graph.facebook.com/v2.6/me/#{endpoint}?access_token=#{System.get_env("FACEBOOK_PAGE_ACCESS_TOKEN")}"
  end
end
