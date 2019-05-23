defmodule Vigepets.Reactions.Lick do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vigepets.Animals.Pupper
  alias Vigepets.Woofs.Woof

  schema "licks" do
    belongs_to :woof, Woof
    belongs_to :pupper, Pupper

    timestamps()
  end

  @doc false
  @required_fields ~w(woof_id pupper_id)a
  @optional_fields ~w()a

  def changeset(lick, attrs) do
    lick
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:pupper_id)
    |> foreign_key_constraint(:woof_id)
    |> unique_constraint(:woof_pupper, name: :woof_pupper_index)
  end
end
