defmodule Kitteh.PageController do
  use Kitteh.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
