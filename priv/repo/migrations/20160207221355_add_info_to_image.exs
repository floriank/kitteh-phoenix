defmodule Kitteh.Repo.Migrations.AddInfoToImage do
  use Ecto.Migration

  def change do
    alter table(:images) do
      add :content_type, :string
      add :path, :string
      add :generated_name, :string
      add :type, :string # one of Kitty or Doge (maybe later)
    end
    rename table(:images), :name, to: :original_name
    rename table(:images), :url, to: :token
    create unique_index(:images, [:token])
  end
end
