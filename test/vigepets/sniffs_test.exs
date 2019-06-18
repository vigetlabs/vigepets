defmodule Vigepets.SniffsTest do
  use Vigepets.DataCase
  import Vigepets.Factory
  alias Vigepets.Sniffs

  describe "sniffs" do
    alias Vigepets.Sniffs.Sniff

    @invalid_attrs %{ followed_id: "string"}

    test "list_sniffs/0 returns all sniffs" do
      sniff = insert(:sniff)
      assert Sniffs.list_sniffs() == [sniff]
    end

    test "get_sniff!/1 returns the sniff with given id" do
      sniff = insert(:sniff)
      assert Sniffs.get_sniff!(sniff.id) == sniff
    end

    test "create_sniff/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sniffs.create_sniff(@invalid_attrs)
    end

    test "update_sniff/2 with valid data updates the sniff" do
      sniff = insert(:sniff)
      pup = insert(:pupper)
      assert {:ok, %Sniff{} = sniff} = Sniffs.update_sniff(sniff, %{follower: pup})
    end

    test "update_sniff/2 with invalid data returns error changeset" do
      sniff = insert(:sniff)
      assert {:error, %Ecto.Changeset{}} = Sniffs.update_sniff(sniff, @invalid_attrs)
      assert sniff == Sniffs.get_sniff!(sniff.id)
    end

    test "delete_sniff/1 deletes the sniff" do
      sniff = insert(:sniff)
      assert {:ok, %Sniff{}} = Sniffs.delete_sniff(sniff)
      assert_raise Ecto.NoResultsError, fn -> Sniffs.get_sniff!(sniff.id) end
    end

    test "change_sniff/1 returns a sniff changeset" do
      sniff = insert(:sniff)
      assert %Ecto.Changeset{} = Sniffs.change_sniff(sniff)
    end
  end
end
