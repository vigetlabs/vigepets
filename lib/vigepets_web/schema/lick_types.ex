defmodule VigepetsWeb.Schema.LickTypes do
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Vigepets.Repo
  
    alias VigepetsWeb.Resolvers
  
    @desc "A like (lick) on a post (woof)"
    object :lick do
      field :id, :id
  
      field :pupper, :pupper, resolve: assoc(:pupper)
      field :woof, :woof, resolve: assoc(:woof)
    end
  
    object :lick_queries do
      @desc "Get all licks/likes for a given woof/post"
      field :woof_licks, list_of(:lick) do
        arg(:woof)
        resolve(&Resolvers.ReactionsResolver.woof_licks/3)
      end
    end
  
    # object :subwoof_mutations do
    #   @desc "Create subwoof"
    #   field :create_subwoof, :subwoof do
    #     arg(:body, non_null(:string))
    #     arg(:woof_id, non_null(:id))
    #     arg(:pupper_id, non_null(:id))
    #     resolve(&Resolvers.subwoofResolver.create/3)
    #   end
    # end
  
    # object :subwoof_subscriptions do
    #   field :subwoof_created, :subwoof do
    #     config(fn _, _ ->
    #       {:ok, topic: "subwoofs"}
    #     end)
  
    #     trigger(:create_subwoof,
    #       topic: fn _ ->
    #         "subwoofs"
    #       end
    #     )
    #   end
    # end
  end
  