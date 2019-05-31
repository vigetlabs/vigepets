defmodule Vigepets.Animals.Pupper do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vigepets.Woofs.Woof

  schema "puppers" do
    field :age, :integer
    field :avatar_url, :string
    field :favorite_toy, :string
    field :name, :string
    field :owner_name, :string

    has_many :woofs, Woof

    timestamps()
  end

  @doc false
  @required_fields ~w(name)a
  @optional_fields ~w(favorite_toy age owner_name avatar_url)a
  def changeset(pupper, attrs) do
    pupper
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> cast_assoc(:woofs, with: &Woof.changeset/2)
  end
end
