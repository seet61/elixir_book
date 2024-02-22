defmodule ServerProcessTest do
  use ExUnit.Case

  test "key value store server" do
    pid = ServerProcess.start(KeyValueStore)

    ServerProcess.call(pid, {:put, :some_key, :some_value})

    assert :some_value == ServerProcess.call(pid, {:get, :some_key})
  end

  test "key value store server integrated" do
    pid = KeyValueStore.start()

    KeyValueStore.put(pid, :some_key1, :some_value1)

    assert :some_value1 == KeyValueStore.get(pid, :some_key1)
  end
end
