import Config

# config :lager, error_logger_redirect: false, handlers: [level: :critical]

config :logger,
  level: :info,
  backends: [:console],
  metadata: :all,
  compile_time_purge_matching: [
    [level_lower_than: :info]
  ]

config :libcluster,
  topologies: [
    epmd_example: [
      # The selected clustering strategy. Required.
      strategy: Cluster.Strategy.Epmd,
      # Configuration for the provided strategy. Optional.
      config: [hosts: Enum.map(0..3, &:"rb_#{&1}@127.0.0.1")],
      # The function to use for connecting nodes. The node
      # name will be appended to the argument list. Optional
      connect: {:net_kernel, :connect_node, []},
      # The function to use for disconnecting nodes. The node
      # name will be appended to the argument list. Optional
      disconnect: {:erlang, :disconnect_node, []},
      # The function to use for listing nodes.
      # This function must return a list of node names. Optional
      list_nodes: {:erlang, :nodes, [:connected]},
    ]
  ]

# config :cloister,
#   otp_app: :swarming,
#   listener: Swarming.Cloister.Listener,
#   consensus: 2,
#   loopback?: false,
#   # additional_modules: [Cloister.Void],
#   sentry: [:"rb_0@127.0.0.1", :"rb_1@127.0.0.1", :"rb_2@127.0.0.1"]


config :swarm,
  distribution_strategy: Swarm.Distribution.StaticQuorumRing,
  static_quorum_size: 2

if (File.exists?("config/#{Mix.env()}.exs")), do: import_config("#{Mix.env()}.exs")
