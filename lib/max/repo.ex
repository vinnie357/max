defmodule Max.Repo do
  use Ecto.Repo,
    otp_app: :max,
    adapter: Ecto.Adapters.Postgres
end
