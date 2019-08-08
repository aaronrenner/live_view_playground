defmodule PhoenixOneFour.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_one_four,
    adapter: Ecto.Adapters.Postgres
end
