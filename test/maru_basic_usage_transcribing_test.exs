defmodule MaruBasicUsageTranscribingTest do
  use ExUnit.Case
  doctest MaruBasicUsageTranscribing

  test "greets the world" do
    assert MaruBasicUsageTranscribing.hello() == :world
  end
end
