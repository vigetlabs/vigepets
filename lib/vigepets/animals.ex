defmodule Vigepets.Animals do
  @moduledoc """
  The Animals context is concerned with users of the application of which the
  primary type is Puppers.
  """

  import Ecto.Query, warn: false
  alias Vigepets.Repo
  alias Vigepets.Animals.Pupper

  @doc """
  Returns the list of puppers.

  ## Examples

      iex> list_puppers()
      [%Pupper{}, ...]

  """
  def list_puppers do
    Repo.all(Pupper)
  end

  @doc """
  Gets a single pupper.

  Raises `Ecto.NoResultsError` if the Pupper does not exist.

  ## Examples

      iex> get_pupper!(123)
      %Pupper{}

      iex> get_pupper!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pupper!(id), do: Repo.get!(Pupper, id)

  @doc """
  Creates a pupper.

  ## Examples

      iex> create_pupper(%{field: value})
      {:ok, %Pupper{}}

      iex> create_pupper(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pupper(attrs \\ %{}) do
    %Pupper{}
    |> Pupper.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pupper.

  ## Examples

      iex> update_pupper(pupper, %{field: new_value})
      {:ok, %Pupper{}}

      iex> update_pupper(pupper, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pupper(%Pupper{} = pupper, attrs) do
    pupper
    |> Pupper.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pupper.

  ## Examples

      iex> delete_pupper(pupper)
      {:ok, %Pupper{}}

      iex> delete_pupper(pupper)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pupper(%Pupper{} = pupper) do
    Repo.delete(pupper)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pupper changes.

  ## Examples

      iex> change_pupper(pupper)
      %Ecto.Changeset{source: %Pupper{}}

  """
  def change_pupper(%Pupper{} = pupper) do
    Pupper.changeset(pupper, %{})
  end
end
