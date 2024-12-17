# Swarming

POC to test Swarm lib.

To start the application you can do this: 

```
iex --name rb_0@127.0.0.1 -S mix
```

Open more terminals for rb_1@127.0.0.1, rb_2@127.0.0.1.

You can open/create more nodes as far you update the cluster topoly, either through lib cluster (default) or Cloister (commented).

## Swarmin topology
By default we use Ring, but the Quorum can be use as well, just un comment the config under `config.exs` and configure the QuorumSize according to your needs.


## Usage

Open 3 new terminal and execute each into each one of the following commands:
```
iex --name rb_0@127.0.0.1 -S mix
```

```
iex --name rb_1@127.0.0.1 -S mix
```

```
iex --name rb_2@127.0.0.1 -S mix
```

This will automatically form a cluster between nodes.

Then just Spwan a Swarming.Worker in any of the terminals, for example.

```
Swarming.DynamicSupervisor.start_child(Node1)
Swarming.DynamicSupervisor.start_child(Node2)
Swarming.DynamicSupervisor.start_child(Node3)
...
...
...
Swarming.DynamicSupervisor.start_child(N processese)
```

You will notice that each node started might not be in the Node that initiated the process.
Check the other terminals to verify the logs, at one of them messages like the following `Node2 says hi!` should be seen.

If you want to check all the processes under Swarm do:
```
iex> Swarm.registered()
[{Node3, #PID<19270.244.0>}, {Node2, #PID<19270.242.0>}, {Node1, #PID<0.259.0>}]
```

If you want to see how the processes moves between nodes, kill any of the existing nodes with some processs within.
You will be able too see immediatly see how it's transfered the process, also one can double check with `Swarm.registered()`