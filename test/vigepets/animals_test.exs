defmodule Vigepets.AnimalsTest do
  use Vigepets.DataCase

  alias Vigepets.Animals

  describe "puppers" do
    alias Vigepets.Animals.Pupper

    @valid_attrs %{age: 42, avatar_url: "some avatar_url", favorite_toy: "some favorite_toy", id: "7488a646-e31f-11e4-aace-600308960662", name: "some name", owner_name: "some owner_name"}
    @update_attrs %{age: 43, avatar_url: "some updated avatar_url", favorite_toy: "some updated favorite_toy", id: "7488a646-e31f-11e4-aace-600308960668", name: "some updated name", owner_name: "some updated owner_name"}
    @invalid_attrs %{age: nil, avatar_url: nil, favorite_toy: nil, id: nil, name: nil, owner_name: nil}

    def pupper_fixture(attrs \\ %{}) do
      {:ok, pupper} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Animals.create_pupper()

      pupper
    end

    test "list_puppers/0 returns all puppers" do
      pupper = pupper_fixture()
      assert Animals.list_puppers() == [pupper]
    end

    test "get_pupper!/1 returns the pupper with given id" do
      pupper = pupper_fixture()
      assert Animals.get_pupper!(pupper.id) == pupper
    end

    test "create_pupper/1 with valid data creates a pupper" do
      assert {:ok, %Pupper{} = pupper} = Animals.create_pupper(@valid_attrs)
      assert pupper.age == 42
      assert pupper.avatar_url == "some avatar_url"
      assert pupper.favorite_toy == "some favorite_toy"
      assert pupper.id == "7488a646-e31f-11e4-aace-600308960662"
      assert pupper.name == "some name"
      assert pupper.owner_name == "some owner_name"
    end

    test "create_pupper/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animals.create_pupper(@invalid_attrs)
    end

    test "update_pupper/2 with valid data updates the pupper" do
      pupper = pupper_fixture()
      assert {:ok, %Pupper{} = pupper} = Animals.update_pupper(pupper, @update_attrs)
      assert pupper.age == 43
      assert pupper.avatar_url == "some updated avatar_url"
      assert pupper.favorite_toy == "some updated favorite_toy"
      assert pupper.id == "7488a646-e31f-11e4-aace-600308960668"
      assert pupper.name == "some updated name"
      assert pupper.owner_name == "some updated owner_name"
    end

    test "update_pupper/2 with invalid data returns error changeset" do
      pupper = pupper_fixture()
      assert {:error, %Ecto.Changeset{}} = Animals.update_pupper(pupper, @invalid_attrs)
      assert pupper == Animals.get_pupper!(pupper.id)
    end

    test "delete_pupper/1 deletes the pupper" do
      pupper = pupper_fixture()
      assert {:ok, %Pupper{}} = Animals.delete_pupper(pupper)
      assert_raise Ecto.NoResultsError, fn -> Animals.get_pupper!(pupper.id) end
    end

    test "change_pupper/1 returns a pupper changeset" do
      pupper = pupper_fixture()
      assert %Ecto.Changeset{} = Animals.change_pupper(pupper)
    end
  end
end
