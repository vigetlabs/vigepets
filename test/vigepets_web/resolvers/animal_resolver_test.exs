defmodule VigepetsWeb.AnimalResolverTest do
  use VigepetsWeb.ConnCase

  alias VigepetsWeb.Resolvers.AnimalResolver

  describe "#list_puppers/3" do
    it "returns puppers" do
      first_pupper = insert(:pupper)
      second_pupper = insert(:pupper)
      {:ok, results} = AnimalResolver.list_puppers(nil, nil, nil)

      assert length(results) == 2
      assert List.first(results).id == second_pupper.id
      assert List.last(results).id == first_pupper.id
    end
  end
end
