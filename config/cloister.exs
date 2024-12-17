import Config

# This is a typicat config for cloister, might be included into `env.exs` files

consensus = 3

config :cloister,
  otp_app: :rates_blender,
  listener: Swa.Cloister.Listener,
  consensus: consensus,
  loopback?: true,
  additional_modules: [Cloister.Void],
  sentry: Enum.map(0..consensus, &:"rates_blender_#{&1}@127.0.0.1")
