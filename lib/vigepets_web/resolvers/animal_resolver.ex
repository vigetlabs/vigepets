defmodule VigepetsWeb.Resolvers.AnimalResolver do
  alias Vigepets.Animals

  @spec list_puppers(any, any, any) :: {:ok, any}
  def list_puppers(_parent, _args, _resolutions) do
    {:ok, Animals.list_puppers()}
  end

  @spec create_pupper(
          any,
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any},
          any
        ) :: {:error, [any]} | {:ok, any}
  def create_pupper(_parent, args, _resolutions) do
    args
    |> Animals.create_pupper()
    |> case do
      {:ok, pupper} ->
        {:ok, pupper}

      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  defp extract_error_msg(changeset) do
    changeset.errors
    |> Enum.map(fn {field, {error, _details}} ->
      [
        field: field,
        message: String.capitalize(error)
      ]
    end)
  end
end
