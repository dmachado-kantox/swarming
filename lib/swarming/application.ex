defmodule Swarming.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Swarming.Worker.start_link(arg)
      # {Swarming.Worker, arg}
      # {Cluster.Supervisor, [Application.get_env(:libcluster, :topologies), [name: Swarming.ClusterSupervisor]]},
      {Horde.Registry, [name: Swarming.HordeRegistry, keys: :unique]},
      Swarming.HordeSupervisor,
      Swarming.DynamicSupervisor
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Swarming.Supervisor]
    Supervisor.start_link(children, opts)
  end



  # Alternatives to start processs
  # def start_worker(name) do
  #   {:ok, pid} =
  #     case DynamicSupervisor.start_child(Swarming.DynamicSupervisor, {Swarming.Worker, name}) do
  #       {:ok, _} = resp -> resp
  #        {:error, {:invalid_return, {:error, {:already_started, pid}}}} -> {:ok, pid}
  #       {:error, {:already_started, pid}} -> {:ok, pid}
  #       error -> error
  #     end

  #     Swarm.register_name(name, pid)


  #     {:ok, pid} = case Swarm.register_name(name, Swarming.Worker, :start_link, [name]) do
  #       {:ok, _} = resp -> resp
  #       {:error, {:already_started, pid}} -> {:ok, pid}
  #        {:error, {:invalid_return, {:error, {:already_started, pid}}}} -> {:ok, pid}
  #       error -> error
  #     end
  #   Swarm.join(:foo, pid)
  # end

  # def spwan_workers(worker_count) do
  #   procs =
  #     for n <- 4..worker_count do
  #       # name = {:"worker#{n}", n}
  #       name = :"worker#{n}"
  #       {:ok, pid} =Swarm.register_name(name, Swarming.Worker, :start_link, [name])
  #       Swarm.join(:foo, pid)
  #       {node(pid), name, pid}
  #     end
  # end
end
