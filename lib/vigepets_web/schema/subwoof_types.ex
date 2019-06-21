defmodule VigepetsWeb.Schema.SubwoofTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Vigepets.Repo

  alias VigepetsWeb.Resolvers

  @desc "A comment (subwoof) on a post (woof)"
  object :subwoof do
    field :id, :id
    field :body, :string

    field :pupper, :pupper, resolve: assoc(:pupper)
  end

  object :subwoof_queries do
    @desc "Get all subwoofs/comments for a given woof/post"
    field :woof_subwoofs, list_of(:subwoof) do
      arg(:woof)
      resolve(&Resolvers.SubwoofResolver.woof_subwoofs/3)
    end
  end

  object :subwoof_subscriptions do
    field :subwoof_created, :subwoof do
      config(fn _, _ ->
        {:ok, topic: "subwoofs"}
      end)

      trigger(:create_subwoof,
        topic: fn _ ->
          "subwoofs"
        end
      )
    end
  end
end
