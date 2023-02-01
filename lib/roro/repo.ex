defmodule Roro.Repo do
  use Ecto.Repo,
    otp_app: :roro,
    adapter: Ecto.Adapters.Postgres
end
