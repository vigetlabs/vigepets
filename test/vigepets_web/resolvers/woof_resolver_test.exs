defmodule VigepetsWeb.WoofResolverTest do
  use VigepetsWeb.ConnCase

  alias VigepetsWeb.Resolvers.WoofResolver

  describe "#list_woofs/3" do
    it "returns woofs" do
      woof_a = insert(:woof)
      woof_b = insert(:woof)
      {:ok, results} = WoofResolver.list_woofs(nil, nil, nil)

      assert length(results) == 2
      assert List.first(results).id == woof_b.id
      assert List.last(results).id == woof_a.id
    end
  end

  describe "#create_woof/3" do
    it "creates a valid woof with an associated pupper" do
      pupper = insert(:pupper)

      {:ok, woof} =
        WoofResolver.create_woof(
          nil,
          %{body: "Bork",
          pupper_id: pupper.id},
          nil
        )

      assert woof.body == "Bork"
      assert woof.pupper_id == pupper.id
    end

    it "returns error for missing params" do
      pupper = insert(:pupper)

      {:error, error} =
        WoofResolver.create_woof(nil, %{}, nil)

        assert error == [[field: :body, message: "Can't be blank"],
          [field: :pupper_id, message: "Can't be blank"]] 
    end
  end
end
