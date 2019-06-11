defmodule Vigepets.Sniffs.Sniff do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vigepets.Animals.Pupper
  alias Vigepets.Woofs.Woof

  schema "sniffs" do
    belongs_to :follower, Pupper
    belongs_to :followed, Pupper

    timestamps()
  end

  @doc false
  @required_fields ~w(follower_id followed_id)a
  @optional_fields ~w()a
  def changeset(pupper, attrs) do
    pupper
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:unique_sniff_relationship, name: :unique_sniff)
  end

end
