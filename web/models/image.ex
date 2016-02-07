defmodule Kitteh.Image do
  use Kitteh.Web, :model

  schema "images" do
    field :name, :string
    field :url, :string
    field :size, :integer
    field :file, :string, virtual: true

    timestamps
  end

  @required_fields ~w(name url size)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
