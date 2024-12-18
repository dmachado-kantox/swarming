defmodule Swarming.HordeSupervisor do
  use Horde.DynamicSupervisor

  def start_link(_) do
    Horde.DynamicSupervisor.start_link(
      __MODULE__,
      [strategy: :one_for_one],
      name: __MODULE__
    )
  end

  def init(init_arg) do
    [strategy: :one_for_one, members: :auto]
    |> Keyword.merge(init_arg)
    |> Horde.DynamicSupervisor.init()
  end

  def start_child(name) do
    spec = Supervisor.child_spec(Swarming.Worker, id: name, start: {Swarming.Worker, :start_link, [name]})
    Horde.DynamicSupervisor.start_child(__MODULE__, spec)
  end
end
