defmodule BanditNativeTest do
  use ExUnit.Case
  doctest BanditNative

  test "greets the world" do
    assert BanditNative.hello() == :world
  end
end
