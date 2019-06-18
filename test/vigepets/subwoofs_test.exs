defmodule Vigepets.SubwoofsTest do
  use Vigepets.DataCase
  import Vigepets.Factory
  alias Vigepets.Subwoofs

  describe "subwoofs" do
    alias Vigepets.Subwoofs.Subwoof

    @valid_attrs %{body: "some body"}
    @update_attrs %{body: "some updated body"}
    @invalid_attrs %{body: nil}

    test "list_subwoofs/0 returns all subwoofs" do
      subwoof = insert(:subwoof)
      assert Subwoofs.list_subwoofs() == [subwoof]
    end

    test "get_subwoof!/1 returns the subwoof with given id" do
      subwoof = insert(:subwoof)
      assert Subwoofs.get_subwoof!(subwoof.id) == subwoof
    end

    test "create_subwoof/1 with valid data creates a subwoof" do
      subwoof = insert(:subwoof, @valid_attrs)
      assert subwoof.body == "some body"
    end

    test "create_subwoof/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subwoofs.create_subwoof(@invalid_attrs)
    end

    test "update_subwoof/2 with valid data updates the subwoof" do
      subwoof = insert(:subwoof)
      assert {:ok, %Subwoof{} = subwoof} = Subwoofs.update_subwoof(subwoof, @update_attrs)
      assert subwoof.body == "some updated body"
    end

    test "update_subwoof/2 with invalid data returns error changeset" do
      subwoof = insert(:subwoof)
      assert {:error, %Ecto.Changeset{}} = Subwoofs.update_subwoof(subwoof, @invalid_attrs)
      assert subwoof == Subwoofs.get_subwoof!(subwoof.id)
    end

    test "delete_subwoof/1 deletes the subwoof" do
      subwoof = insert(:subwoof)
      assert {:ok, %Subwoof{}} = Subwoofs.delete_subwoof(subwoof)
      assert_raise Ecto.NoResultsError, fn -> Subwoofs.get_subwoof!(subwoof.id) end
    end

    test "change_subwoof/1 returns a subwoof changeset" do
      subwoof = insert(:subwoof)
      assert %Ecto.Changeset{} = Subwoofs.change_subwoof(subwoof)
    end
  end
end
