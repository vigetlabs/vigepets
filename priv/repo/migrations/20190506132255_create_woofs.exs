defmodule Vigepets.Repo.Migrations.CreateWoofs do
  use Ecto.Migration

  def change do
    create table(:woofs) do
      add :body, :string, null: false
      add :pupper_id, references(:puppers, on_delete: :delete_all), null: false

      timestamps()
    end

    alter table(:puppers) do
      add :woof_id, references(:woofs)
    end
  end
end
