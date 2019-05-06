defmodule Vigepets.WoofsTest do
  use Vigepets.DataCase
  import Vigepets.Factory
  alias Vigepets.Woofs

  describe "woofs" do
    alias Vigepets.Woofs.Woof

    @valid_attrs %{body: "First woof"}
    @update_attrs %{body: "First woof edited"}
    @invalid_attrs %{body: nil}

    test "list_woof/0 returns all woofs" do
      woof = insert(:woof)
      assert Woofs.list_woofs() == [woof]
    end

    test "get_woof!/1 returns the woof with given id" do
      woof = insert(:woof)
      assert Woofs.get_woof!(woof.id) == woof
    end

    test "create_woof/1 with valid data creates a woof" do
      woof = insert(:woof, @valid_attrs)
      assert woof.body == "First woof"
    end

    test "create_woof/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Woofs.create_woof(@invalid_attrs)
    end

    test "update_woof/2 with valid data updates the woof" do
      woof = insert(:woof)
      assert {:ok, %Woof{} = woof} = Woofs.update_woof(woof, @update_attrs)
      assert woof.body == "First woof edited"
    end

    test "update_woof/2 with invalid data returns error changeset" do
      woof = insert(:woof)
      assert {:error, %Ecto.Changeset{}} = Woofs.update_woof(woof, @invalid_attrs)
      assert woof == Woofs.get_woof!(woof.id)
    end

    test "delete_woof/1 deletes the woof" do
      woof = insert(:woof)
      assert {:ok, %Woof{}} = Woofs.delete_woof(woof)
      assert_raise Ecto.NoResultsError, fn -> Woofs.get_woof!(woof.id) end
    end

    test "change_woof/1 returns a woof changeset" do
      woof = insert(:woof)
      assert %Ecto.Changeset{} = Woofs.change_woof(woof)
    end
  end
end
