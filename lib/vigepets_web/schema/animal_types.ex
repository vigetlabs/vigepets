defmodule VigepetsWeb.Schema.AnimalTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Vigepets.Repo

  alias VigepetsWeb.Resolvers

  @desc "An adorable pupper"
  object :pupper do
    field :id, :id
    field :age, :integer
    field :favorite_toy, :string
    field :avatar_url, :string
    field :name, :string
    field :owner_name, :string
  end

  object :animal_queries do
    @desc "Get all puppers"
    field :list_puppers, list_of(:pupper) do
      resolve(&Resolvers.AnimalResolver.list_puppers/3)
    end
  end

  object :animal_mutations do
    field :create_pupper, :pupper do
      arg(:name, non_null(:string))
      arg(:avatar_url, :string)
      arg(:favorite_toy, :string)
      arg(:owner_name, :string)
      arg(:age, :integer)

      resolve(&Resolvers.AnimalResolver.create_pupper/3)
    end
  end

  object :animal_subscriptions do
    field :pupper_created, :pupper do
      IO.puts("Pupper created!")

      config(fn _, _ ->
        {:ok, topic: "puppers"}
      end)

      trigger(:create_pupper,
        topic: fn _ ->
          "puppers"
        end
      )
    end
  end
end
