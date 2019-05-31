defmodule VigepetsWeb.AbsintheSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: VigepetsWeb.Schema

  def connect(_, socket) do
    {:ok, socket}
  end

  def id(_), do: nil
end
