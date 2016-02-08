defmodule Kitteh.PageController do
  use Kitteh.Web, :controller
  alias Kitteh.Repo
  alias Kitteh.Image

  def index(conn, _params) do
    changeset = Image.changeset(%Image{})
    render conn, "index.html", changeset: changeset
  end

  def show(conn, %{ "name" => name }) do
    token = String.downcase(name)
      |> String.replace(~r/kitty/, "")
    image = Repo.get_by(Image, token: token)
    if is_nil(image) do
      redirect conn, to: "/"
    else
      render conn, "show.html", image: image
    end
  end

  # match the file from the params
  def upload(conn, %{ "image" => %{ "file" => file } }) do

    # transform the uploaded file into a changeset
    params = file
      |> copy_file(unique_name)
    changeset = Image.changeset(%Image{}, params)

    case Repo.insert(changeset) do
      { :ok, image } ->
        conn
        |> put_flash(:info, "Uploaded")
        |> redirect to: "/#{full_name(image)}"
      { :error, changeset } ->
        conn
        |> put_flash(:error, "Error!")
        |> render("index.html", changeset: changeset)
    end
  end

  defp full_name(image) do
    "#{image.generated_name}#{image.type}"
  end

  @doc """
  Tries to assign a unique name into the changeset that does not exist in the database yet
  """
  defp unique_name do
    name = Image.generate_unique_name

    exists = Repo.all(from i in Kitteh.Image, where: i.token == ^String.downcase(name))
      |> length

    if exists > 0 do
      unique_name
    else
      name
    end
  end

  defp copy_file(file, name) do
    extension = Path.extname(file.filename)
    target = target_path <> name <> extension
    case File.copy(file.path, target) do
      {:ok, size} ->
        %{
          generated_name: name,
          token: String.downcase(name),
          path: target,
          original_name: file.filename,
          content_type: file.content_type,
          size: size
        }
      { :error, _} ->
        %{}
    end
  end

  defp target_path do
    Application.app_dir(:kitteh, "priv") <> "/static/uploads/"
  end
end
