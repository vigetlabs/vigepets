defmodule Vigepets.Repo.Migrations.CreateLicks do
  use Ecto.Migration

  def change do
    create table(:licks) do
      add :woof_id, references(:woofs, on_delete: :delete_all), null: :false
      add :pupper_id, references(:puppers, on_delete: :delete_all), null: :false

      timestamps()
    end

    create unique_index(:licks, [:woof_id, :pupper_id], name: :woof_pupper_index)
  end
end
