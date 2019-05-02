defmodule Vigepets.Repo.Migrations.CreatePuppers do
  use Ecto.Migration

  def change do
    create table(:puppers) do
      add :name, :string, null: false
      add :favorite_toy, :string
      add :age, :integer
      add :owner_name, :string
      add :avatar_url, :string

      timestamps()
    end

  end
end
