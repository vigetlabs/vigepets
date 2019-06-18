defmodule Vigepets.Sniffs do
  @moduledoc """
  The Sniffs context.
  """

  import Ecto.Query, warn: false
  alias Vigepets.Repo

  alias Vigepets.Sniffs.Sniff
  alias Vigepets.Animals.Pupper


  @doc """
  Returns the list of sniffs.

  ## Examples

      iex> list_sniffs()
      [%Sniff{}, ...]

  """
  def list_sniffs do
    Repo.all(Sniff) |> Repo.preload([:follower, :followed])
  end

  @doc """
  Gets a single sniff.

  Raises `Ecto.NoResultsError` if the Sniff does not exist.

  ## Examples

      iex> get_sniff!(123)
      %Sniff{}

      iex> get_sniff!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sniff!(id) do
    Repo.get!(Sniff, id) |> Repo.preload([:followed, :follower])
  end

  @doc """
  Creates a sniff.

  ## Examples

      iex> create_sniff(%{field: value})
      {:ok, %Sniff{}}

      iex> create_sniff(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sniff(attrs \\ %{}) do
    %Sniff{}
    |> Sniff.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sniff.

  ## Examples

      iex> update_sniff(sniff, %{field: new_value})
      {:ok, %Sniff{}}

      iex> update_sniff(sniff, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sniff(%Sniff{} = sniff, attrs) do
    sniff
    |> Sniff.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sniff.

  ## Examples

      iex> delete_sniff(sniff)
      {:ok, %Sniff{}}

      iex> delete_sniff(sniff)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sniff(%Sniff{} = sniff) do
    Repo.delete(sniff)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sniff changes.

  ## Examples

      iex> change_sniff(sniff)
      %Ecto.Changeset{source: %Sniff{}}

  """
  def change_sniff(%Sniff{} = sniff) do
    Sniff.changeset(sniff, %{})
  end

  @doc """
  Return list of sniffs (puppers being sniffed/followed by the given pupper)
  """
  def pupper_sniffs(%Pupper{} = pupper) do
    pupper = Repo.preload(pupper, :followeds)
    pupper.followeds
  end

  @doc """
  Return list of sniffers (puppers sniffing/follwing the given pupper)
  """
  def pupper_sniffers(%Pupper{} = pupper) do
    pupper = Repo.preload(pupper, :followers)
    pupper.followers
  end

end
