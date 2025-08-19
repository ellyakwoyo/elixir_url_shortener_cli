defmodule ElixirUrlShortenerCliTest do
  use ExUnit.Case
  doctest ElixirUrlShortenerCli

  test "greets the world" do
    assert ElixirUrlShortenerCli.hello() == :world
  end
end
