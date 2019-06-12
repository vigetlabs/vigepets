defmodule Vigepets.Woofs.Woof do
  use Ecto.Schema
  import Ecto.Changeset

  alias Vigepets.Animals.Pupper
  alias Vigepets.Subwoofs.Subwoof
  alias Vigepets.Reactions.Lick

  schema "woofs" do
    field :body, :string
    belongs_to :pupper, Pupper
    has_many :subwoofs, Subwoof
    has_many :licks, Lick

    timestamps()
  end

  def create(attrs) do
    attrs
    |> changeset()
    |> Repo.insert()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
  end

  @doc false
  @required_fields ~w(body pupper_id)a
  @optional_fields ~w()a

  def changeset(woof, attrs) do
    woof
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:pupper_id)
  end
end
