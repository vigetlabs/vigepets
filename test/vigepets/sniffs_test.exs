defmodule Vigepets.SniffsTest do
  use Vigepets.DataCase

  alias Vigepets.Sniffs

  describe "sniffs" do
    alias Vigepets.Sniffs.Sniff

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def sniff_fixture(attrs \\ %{}) do
      {:ok, sniff} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sniffs.create_sniff()

      sniff
    end

    test "list_sniffs/0 returns all sniffs" do
      sniff = sniff_fixture()
      assert Sniffs.list_sniffs() == [sniff]
    end

    test "get_sniff!/1 returns the sniff with given id" do
      sniff = sniff_fixture()
      assert Sniffs.get_sniff!(sniff.id) == sniff
    end

    test "create_sniff/1 with valid data creates a sniff" do
      assert {:ok, %Sniff{} = sniff} = Sniffs.create_sniff(@valid_attrs)
    end

    test "create_sniff/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sniffs.create_sniff(@invalid_attrs)
    end

    test "update_sniff/2 with valid data updates the sniff" do
      sniff = sniff_fixture()
      assert {:ok, %Sniff{} = sniff} = Sniffs.update_sniff(sniff, @update_attrs)
    end

    test "update_sniff/2 with invalid data returns error changeset" do
      sniff = sniff_fixture()
      assert {:error, %Ecto.Changeset{}} = Sniffs.update_sniff(sniff, @invalid_attrs)
      assert sniff == Sniffs.get_sniff!(sniff.id)
    end

    test "delete_sniff/1 deletes the sniff" do
      sniff = sniff_fixture()
      assert {:ok, %Sniff{}} = Sniffs.delete_sniff(sniff)
      assert_raise Ecto.NoResultsError, fn -> Sniffs.get_sniff!(sniff.id) end
    end

    test "change_sniff/1 returns a sniff changeset" do
      sniff = sniff_fixture()
      assert %Ecto.Changeset{} = Sniffs.change_sniff(sniff)
    end
  end
end
