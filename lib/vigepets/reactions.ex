defmodule Vigepets.Reactions do
  @moduledoc """
  The Reactions context is concerned with reactions, primary licks (likes) that
  users of the application (puppers) put on woofs (comments).
  """

  import Ecto.Query, warn: false
  alias Vigepets.Repo
  alias Vigepets.Reactions.Lick

  @doc """
  Returns the list of licks.

  ## Examples

      iex> list_licks()
      [%Lick{}, ...]

  """
  def list_licks do
    Repo.all(Lick) |> Repo.preload([:pupper, woof: :pupper])
  end

  @doc """
  Gets a single lick.

  Raises `Ecto.NoResultsError` if the Lick does not exist.

  ## Examples

      iex> get_lick!(123)
      %Lick{}

      iex> get_lick!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lick!(id), do: Repo.get!(Lick, id) |> Repo.preload([:pupper, woof: :pupper])

  @doc """
  Creates a lick.

  ## Examples

      iex> create_lick(%{field: value})
      {:ok, %Lick{}}

      iex> create_lick(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lick(attrs \\ %{}) do
    %Lick{}
    |> Lick.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lick.

  ## Examples

      iex> update_lick(lick, %{field: new_value})
      {:ok, %Lick{}}

      iex> update_lick(lick, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lick(%Lick{} = lick, attrs) do
    lick
    |> Lick.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Lick.

  ## Examples

      iex> delete_lick(lick)
      {:ok, %Lick{}}

      iex> delete_lick(lick)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lick(%Lick{} = lick) do
    Repo.delete(lick)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lick changes.

  ## Examples

      iex> change_lick(lick)
      %Ecto.Changeset{source: %Lick{}}

  """
  def change_lick(%Lick{} = lick) do
    Lick.changeset(lick, %{})
  end
end
