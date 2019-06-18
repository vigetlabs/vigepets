defmodule VigepetsWeb.Schema.WoofTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Vigepets.Repo

  import Ecto.Query
  alias VigepetsWeb.Resolvers

  @desc "A post (woof) on the site"
  object :woof do
    field :id, :id
    field :body, :string

    field :pupper, :pupper, resolve: assoc(:pupper)
    field :licks, list_of(:lick), resolve: assoc(:licks)
    field :subwoofs, list_of(:subwoof) do
      resolve(
        assoc(:subwoofs, fn woof_subwoofs, woof, _context ->
          woof_subwoofs |> order_by(asc: :updated_at)
        end)
      )
    end
  end

  object :woof_queries do
    @desc "Get all woofs/posts"
    field :list_woofs, list_of(:woof) do
      resolve(&Resolvers.WoofResolver.list_woofs/3)
    end

    @desc "Get a specific woof"
    field :woof, :woof do
      arg(:id, non_null(:id))
      resolve(&Resolvers.WoofResolver.show/3)
    end
  end

  object :woof_mutations do
    @desc "Create woof"
    field :create_woof, :woof do
      arg(:body, non_null(:string))
      arg(:pupper_id, non_null(:integer))

      resolve(&Resolvers.WoofResolver.create/3)
    end
  end

  object :woof_subscriptions do
    field :woof_created, :woof do
      config(fn _, _ ->
        {:ok, topic: "woofs"}
      end)

      trigger(:create_woof,
        topic: fn _ ->
          "woofs"
        end
      )
    end
  end
end
