defmodule Vigepets.Subwoofs do
  @moduledoc """
  The Subwoofs context.
  """

  import Ecto.Query, warn: false
  alias Vigepets.Repo

  alias Vigepets.Subwoofs.Subwoof
  alias Vigepets.Woofs.Woof

  @doc """
  Returns the list of subwoofs.

  ## Examples

      iex> list_subwoofs()
      [%Subwoof{}, ...]

  """
  def list_subwoofs do
    Repo.all(Subwoof)
  end

  @doc """
  Gets a single subwoof.

  Raises `Ecto.NoResultsError` if the Subwoof does not exist.

  ## Examples

      iex> get_subwoof!(123)
      %Subwoof{}

      iex> get_subwoof!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subwoof!(id), do: Repo.get!(Subwoof, id)

  @doc """
  Creates a subwoof.

  ## Examples

      iex> create_subwoof(%{field: value})
      {:ok, %Subwoof{}}

      iex> create_subwoof(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_subwoof(attrs \\ %{}) do
    %Subwoof{}
    |> Subwoof.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subwoof.

  ## Examples

      iex> update_subwoof(subwoof, %{field: new_value})
      {:ok, %Subwoof{}}

      iex> update_subwoof(subwoof, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subwoof(%Subwoof{} = subwoof, attrs) do
    subwoof
    |> Subwoof.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Subwoof.

  ## Examples

      iex> delete_subwoof(subwoof)
      {:ok, %Subwoof{}}

      iex> delete_subwoof(subwoof)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subwoof(%Subwoof{} = subwoof) do
    Repo.delete(subwoof)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subwoof changes.

  ## Examples

      iex> change_subwoof(subwoof)
      %Ecto.Changeset{source: %Subwoof{}}

  """
  def change_subwoof(%Subwoof{} = subwoof) do
    Subwoof.changeset(subwoof, %{})
  end

  @doc """
  Return list of subwoofs for a given woof
  """
  def woof_subwoofs(%Woof{} = woof) do
    woof = Repo.preload(woof, :subwoofs)
    woof.subwoofs
  end
  
end
