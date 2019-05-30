defmodule VigepetsWeb.Schema.AnimalTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Vigepets.Repo

  alias VigepetsWeb.Resolvers

  @desc "An adorable pupper"
  object :pupper do
    field :id, :id
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
      arg(:body, non_null(:string))

      resolve(&Resolvers.AnimalResolver.create_pupper/3)
    end
  end

  object :animal_subscriptions do
    field :pupper_created, :pupper do
    end
  end
end
