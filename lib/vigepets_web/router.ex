defmodule VigepetsWeb.Router do
  use VigepetsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: VigepetsWeb.Schema

    forward "/", Absinthe.Plug, schema: VigepetsWeb.Schema
  end
end
