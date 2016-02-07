defmodule Kitteh.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :name, :string
      add :url, :string
      add :size, :integer

      timestamps
    end

  end
end
