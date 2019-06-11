defmodule Vigepets.Repo.Migrations.CreateSniffs do
  use Ecto.Migration

  def change do
    create table(:sniffs) do
      add :follower_id, references(:puppers, on_delete: :delete_all), null: false
      add :followed_id, references(:puppers, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:sniffs, [:follower_id])
    create index(:sniffs, [:followed_id])
    create unique_index(:sniffs, [:follower_id, :followed_id], name: :unique_sniff)
  end
end
