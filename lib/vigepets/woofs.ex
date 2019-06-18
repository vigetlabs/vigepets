defmodule Vigepets.Woofs do
  @moduledoc """
  The Woofs context is concerned with posts that users of the application
  (puppers) create.
  """

  import Ecto.Query, warn: false
  alias Vigepets.Repo
  alias Vigepets.Woofs.Woof
  alias Vigepets.Animals.Pupper

  @doc """
  Returns the list of woofs.

  ## Examples

      iex> list_woofs()
      [%Woof{}, ...]

  """
  def list_woofs do
    Repo.all(from w in Woof, order_by: [desc: w.updated_at, desc: w.id]) |> Repo.preload(:pupper)
  end

  @doc """
  Gets a single woof.

  Raises `Ecto.NoResultsError` if the Woof does not exist.

  ## Examples

      iex> get_woof!(123)
      %Woof{}

      iex> get_woof!(456)
      ** (Ecto.NoResultsError)

  """
  def get_woof!(id), do: Repo.get!(Woof, id) |> Repo.preload(:pupper)

  @doc """
  Creates a woof.

  ## Examples

      iex> create_woof(%{field: value})
      {:ok, %Woof{}}

      iex> create_woof(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_woof(attrs \\ %{}) do
    %Woof{}
    |> Woof.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a woof.

  ## Examples

      iex> update_woof(woof, %{field: new_value})
      {:ok, %Woof{}}

      iex> update_woof(woof, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_woof(%Woof{} = woof, attrs) do
    woof
    |> Woof.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a woof.

  ## Examples

      iex> delete_woof(woof)
      {:ok, %Woof{}}

      iex> delete_woof(woof)
      {:error, %Ecto.Changeset{}}

  """
  def delete_woof(%Woof{} = woof) do
    Repo.delete(woof)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking woof changes.

  ## Examples

      iex> change_woof(woof)
      %Ecto.Changeset{source: %Woof{}}

  """
  def change_woof(%Woof{} = woof) do
    Woof.changeset(woof, %{})
  end

    @doc """
  Return list of woofs for a given pupper
  """
  def pupper_woofs(%Pupper{} = pupper) do
    pupper = Repo.preload(pupper, :woofs)
    pupper.woofs
  end

end
