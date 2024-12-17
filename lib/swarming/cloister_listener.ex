# defmodule Swarming.Cloister.Listener do
#   @moduledoc false

#   @behaviour Cloister.Listener
#   require Logger

#   @impl Cloister.Listener
#   def on_state_change(from, to, %Cloister.Monitor{node: node, sentry?: sentry?}) do
#     Logger.info(
#       "Distributed cluster state has changed ‹#{from}› → ‹#{to}›, node: ‹#{node}›, sentry?: ‹#{sentry?}›"
#     )
#   end
# end
