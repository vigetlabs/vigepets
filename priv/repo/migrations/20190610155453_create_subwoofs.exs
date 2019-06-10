defmodule Vigepets.Repo.Migrations.CreateSubwoofs do
  use Ecto.Migration

  def change do
    create table(:subwoofs) do
      add :body, :string
      add :pupper_id, references(:puppers, on_delete: :delete_all), null: false
      add :woof_id, references(:woofs, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:subwoofs, [:pupper_id])
    create index(:subwoofs, [:woof_id])
  end
end
