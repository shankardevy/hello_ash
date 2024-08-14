defmodule HelloAsh.Auth do
  use Ash.Domain

  resources do
    resource HelloAsh.Auth.User
  end
end
