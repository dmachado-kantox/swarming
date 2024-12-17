import Config

config :logger, level: :info

config :cloister,
  consensus: 1,
  loopback?: true,
  additional_modules: [Cloister.Void]
