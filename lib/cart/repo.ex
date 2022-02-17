defmodule Cart.Repo do
  use Ecto.Repo,
    otp_app: :cart,
    adapter: Ecto.Adapters.Postgres
end
