defmodule Kitteh.PageView do
  use Kitteh.Web, :view

  def asset_url(image) do
    "http://localhost:4001/" <> Path.basename(image.path)
  end
end
