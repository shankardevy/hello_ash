defmodule HelloAsh.Network do
  use Ash.Domain

  resources do
    resource HelloAsh.Network.Group
  end
end
