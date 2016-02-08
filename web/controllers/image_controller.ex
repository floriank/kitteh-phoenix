defmodule Kitteh.ImageController do
  use Kitteh.Web, :controller
  alias Kitteh.Image
  alias Kitteh.Repo

  def show(conn, %{ "token" => token }) do
    image = Repo.get_by(Image, token: token)

    if is_nil(image) do
      conn
      |> put_status(:not_found)
      |> render(Kitteh.ErrorView, "404.html")
    else
      { :ok, file } = File.read(image.path)
      conn
      |> put_resp_content_type(image.content_type)
      |> put_resp_header("content-disposition", "attachment; filename=" <> file_name(image))
      |> send_file(200, image.path)
    end
  end

  defp file_name(image) do
    Path.basename(image.path)
  end
end