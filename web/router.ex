defmodule Kitteh.Router do
  use Kitteh.Web, :router

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

  scope "/", Kitteh do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/upload", PageController, :upload
    get "/:name", PageController, :show
    get "/img/:token", ImageController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Kitteh do
  #   pipe_through :api
  # end
end
