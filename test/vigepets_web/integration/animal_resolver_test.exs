defmodule VigepetsWeb.Integration.AnimalResolverTest do
  use VigepetsWeb.ConnCase
  alias Vigepets.AbsintheHelpers

  describe "#list_puppers" do
    it "returns puppers" do
      first_pupper = insert(:pupper)
      second_pupper = insert(:pupper)

      query = """
      {
        listPuppers {
          id
          name
        }
      }
      """

      res =
        build_conn()
        |> post("/graphiql", AbsintheHelpers.query_skeleton(query, "puppers"))

      puppers = json_response(res, 200)["data"]["listPuppers"]

      assert List.first(puppers)["id"] == to_string(second_pupper.id)
      assert List.last(puppers)["id"] == to_string(first_pupper.id)
    end
  end

  describe "#create_pupper" do
    it "creates a new pupper" do
      mutation = """
      {
        createPupper(name: "Joseph") {
          id
          name
        }
      }
      """

      res =
        build_conn()
        |> post("/graphiql", AbsintheHelpers.mutation_skeleton(mutation))

      pupper = json_response(res, 200)["data"]["createPupper"]
      assert pupper["name"] == "Joseph"
    end
  end
end
