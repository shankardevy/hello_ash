defmodule HelloAsh.Auth.User do
  use Ash.Resource,
    domain: HelloAsh.Auth,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "users"
    repo Morsing.Repo
    migrate? false
  end

  attributes do
    integer_primary_key :id

    attribute :email, :string
  end
end
