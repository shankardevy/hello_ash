defmodule HelloAsh.Network.Group do
  use Ash.Resource,
    domain: HelloAsh.Network,
    data_layer: AshPostgres.DataLayer

  actions do
    defaults [:read, create: [:name, :description]]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :description, :string
    timestamps()
  end

  postgres do
    table "groups"
    repo HelloAsh.Repo
  end
end
