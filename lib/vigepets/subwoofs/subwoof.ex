defmodule Vigepets.Subwoofs.Subwoof do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vigepets.Animals.Pupper
  alias Vigepets.Woofs.Woof

  schema "subwoofs" do
    field :body, :string
    belongs_to :pupper, Pupper
    belongs_to :woof, Woof

    timestamps()
  end

  @doc false
  @required_fields ~w(body pupper_id woof_id)a
  @optional_fields ~w()a

  def changeset(subwoof, attrs) do
    subwoof
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:pupper_id)
    |> foreign_key_constraint(:woof_id)
  end
end
