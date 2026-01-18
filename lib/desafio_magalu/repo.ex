defmodule DesafioMagalu.Repo do
  use Ecto.Repo,
    otp_app: :desafio_magalu,
    adapter: Ecto.Adapters.Postgres
end
