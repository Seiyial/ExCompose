defmodule ExcomposeTest do
  use ExUnit.Case
  doctest Excompose

  test "greets the world" do
    assert Excompose.hello() == :world
  end
end
