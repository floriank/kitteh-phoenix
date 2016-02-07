defmodule Kitteh.ImageTest do
  use Kitteh.ModelCase

  alias Kitteh.Image

  @valid_attrs %{name: "some content", size: 42, url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Image.changeset(%Image{}, @invalid_attrs)
    refute changeset.valid?
  end
end
