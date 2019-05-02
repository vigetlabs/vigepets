defmodule Vigepets.Repo do
  use Ecto.Repo,
    otp_app: :vigepets,
    adapter: Ecto.Adapters.Postgres
end
