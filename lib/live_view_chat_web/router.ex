defmodule LiveViewChatWeb.Router do
  use LiveViewChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LiveViewChatWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveViewChatWeb do
    pipe_through :browser

    #get "/", PageController, :index
    live "/", ChatLive, :index
    live "/:id", RoomLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveViewChatWeb do
  #   pipe_through :api
  # end
end
