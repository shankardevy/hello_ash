defmodule HelloAsh.Repo do
  use Ecto.Repo,
    otp_app: :hello_ash,
    adapter: Ecto.Adapters.Postgres
end
