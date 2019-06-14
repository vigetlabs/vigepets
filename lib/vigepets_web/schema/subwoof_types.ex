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
end
