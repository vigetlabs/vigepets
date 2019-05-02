defmodule VigepetsWeb.PageController do
  use VigepetsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
