defmodule VigepetsWeb.Schema.LickTypes do
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Vigepets.Repo
  
    alias VigepetsWeb.Resolvers
  
    @desc "A like (lick) on a post (woof)"
    object :lick do
      field :id, :id
  
      field :pupper, :pupper, resolve: assoc(:pupper)
    end
  
    object :lick_queries do
      @desc "Get all licks/likes for a given woof/post"
      field :woof_licks, list_of(:lick) do
        arg(:woof)
        resolve(&Resolvers.ReactionsResolver.woof_licks/3)
      end
    end
  end
  