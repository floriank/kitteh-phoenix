defmodule Kitteh.PageController do
  use Kitteh.Web, :controller
  alias Kitteh.Repo
  alias Kitteh.Image

  def index(conn, _params) do
    changeset = Image.changeset(%Image{})
    render conn, "index.html", changeset: changeset
  end
end
