defmodule Vigepets.ReactionsTest do
  use Vigepets.DataCase
  import Vigepets.Factory
  alias Vigepets.Reactions

  describe "licks" do
    alias Vigepets.Reactions.Lick

    @update_attrs %{}
    @invalid_attrs %{pupper_id: 'string', woof_id: 'string'}

    test "list_licks/0 returns all licks" do
      lick = insert(:lick)
      assert Reactions.list_licks() == [lick]
    end

    test "get_lick!/1 returns the lick with given id" do
      lick = insert(:lick)
      assert Reactions.get_lick!(lick.id) == lick
    end

    test "create_lick/1 with valid data creates a lick" do
      pupper = insert(:pupper)
      woof = insert(:woof)
      assert {:ok, %Lick{} = lick} = Reactions.create_lick(%{pupper_id: pupper.id, woof_id: woof.id})
    end

    test "create_lick/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reactions.create_lick(@invalid_attrs)
    end

    test "update_lick/2 with valid data updates the lick" do
      lick = insert(:lick)
      assert {:ok, %Lick{} = lick} = Reactions.update_lick(lick, @update_attrs)
    end

    test "update_lick/2 with invalid data returns error changeset" do
      lick = insert(:lick)
      assert {:error, %Ecto.Changeset{}} = Reactions.update_lick(lick, @invalid_attrs)
      assert lick == Reactions.get_lick!(lick.id)
    end

    test "delete_lick/1 deletes the lick" do
      lick = insert(:lick)
      assert {:ok, %Lick{}} = Reactions.delete_lick(lick)
      assert_raise Ecto.NoResultsError, fn -> Reactions.get_lick!(lick.id) end
    end

    test "change_lick/1 returns a lick changeset" do
      lick = insert(:lick)
      assert %Ecto.Changeset{} = Reactions.change_lick(lick)
    end
  end
end
