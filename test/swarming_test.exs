defmodule SwarmingTest do
  use ExUnit.Case
  doctest Swarming

  test "greets the world" do
    assert Swarming.hello() == :world
  end
end
