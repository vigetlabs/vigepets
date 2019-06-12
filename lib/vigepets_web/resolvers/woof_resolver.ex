defmodule VigepetsWeb.Resolvers.WoofResolver do
  alias Vigepets.Woof

  def list(_parent, _args, _resolutions) do
    {:ok, Woof.all()}
  end

  def show(_parent, args, _resolutions) do
    case Woof.find(args[:id]) do
      nil -> {:error, "Not Found"}
      woof -> {:ok, woof}
    end
  end

  def create(_parent, args, _resolutions) do
      args
      |> Woof.create_woof()
      |> case do
        {:ok, woof} ->
          {:ok, woof}

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
