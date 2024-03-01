defmodule Todo.CacheTest do
  use ExUnit.Case

  test "cache init" do
    {:ok, cache} = Todo.Cache.start()
    IO.inspect(cache)

    assert cache != nil

    alice = Todo.Cache.server_process(cache, "Alice's list")
    IO.inspect(alice)
    assert alice != nil

    bob1 = Todo.Cache.server_process(cache, "Bob's list")
    IO.inspect(bob1)
    bob2 = Todo.Cache.server_process(cache, "Bob's list")
    IO.inspect(bob1)

    assert bob1 == bob2

  end
end
