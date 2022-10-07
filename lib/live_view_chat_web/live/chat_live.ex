defmodule LiveViewChatWeb.ChatLive do
  use LiveViewChatWeb, :live_view
  require Logger
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("random-room", _params, socket) do
    random_slug = "/" <> MnemonicSlugs.generate_slug(4)
    {:noreply, push_redirect(socket, to: random_slug)}
  end
end
