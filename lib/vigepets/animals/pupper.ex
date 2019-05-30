defmodule Vigepets.Animals.Pupper do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Vigepets.Woofs.Woof
  alias Vigepets.Subwoofs.Subwoof
  alias Vigepets.Sniffs.Sniff
  alias Vigepets.Animals.Pupper
  alias Vigepets.Repo

  schema "puppers" do
    field :age, :integer
    field :avatar_url, :string
    field :favorite_toy, :string
    field :name, :string
    field :owner_name, :string

    has_many :woofs, Woof
    has_many :subwoofs, Subwoof

    many_to_many :followers, Pupper,
      join_through: "sniffs",
      join_keys: [followed_id: :id, follower_id: :id]

    many_to_many :followeds, Pupper,
      join_through: "sniffs",
      join_keys: [follower_id: :id, followed_id: :id]

    timestamps()
  end

  @spec changeset(:invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}) ::
          map
  def changeset(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
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

  @spec all :: any
  def all() do
    Repo.all(from p in __MODULE__, order_by: [desc: p.id])
  end

  @spec create(:invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}) :: any
  def create(attrs) do
    attrs
    |> changeset
    |> Repo.insert()
  end
end
