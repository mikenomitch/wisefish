defmodule Wisefish.Application do
  @moduledoc """
  The Wisefish Application Service.

  The wisefish system business domain lives in this application.

  Exposes API to clients such as the `WisefishWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Wisefish.Repo, []),
    ], strategy: :one_for_one, name: Wisefish.Supervisor)
  end
end
