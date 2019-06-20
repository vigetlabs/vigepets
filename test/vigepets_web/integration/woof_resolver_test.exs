defmodule VigepetsWeb.Integration.WoofResolverTest do
  use VigepetsWeb.ConnCase
  alias Vigepets.AbsintheHelpers
  require IEx

  describe "#list_woofs/3" do
    it "returns woofs" do
      woof_a = insert(:woof)
      woof_b = insert(:woof)

      query = """
      {
        listWoofs {
          id
          body
        }
      }
      """

      res =
        build_conn()
        |> post("/graphiql", AbsintheHelpers.query_skeleton(query, "woofs"))

      woofs = json_response(res, 200)["data"]["listWoofs"]
      assert List.first(woofs)["id"] == to_string(woof_b.id)
      assert List.last(woofs)["id"] == to_string(woof_a.id)
    end
  end

  describe "#create_woof/3" do
    it "creates a woof" do
      pupper = insert(:pupper)

      mutation = """
      {
        createWoof(body: "Bork Bork", pupper_id: #{pupper.id}){
          body
          pupper {
            id
          }
        }
      }
      """

      res =
        build_conn()
        |> post("graphiql", AbsintheHelpers.mutation_skeleton(mutation))

      woof = json_response(res, 200)["data"]["createWoof"]
      IEx.pry
      assert woof["body"] == "Bork Bork"
      assert woof["pupper"]["id"] == to_string(pupper.id)
    end
  end
end
