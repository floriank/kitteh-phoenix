defmodule Kitteh.PageView do
  use Kitteh.Web, :view

  def asset_url(image) do
    "/img/" <> image.token
  end
end
