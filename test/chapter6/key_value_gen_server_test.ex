defmodule KeyValueStoreGenServerTest do
  use ExUnit.Case

  test "key value GenServer example" do
    {:ok, pid} = KeyValueStoreGenServer.start()

    KeyValueStoreGenServer.put(pid, :some_key, :some_value)

    assert :some_value == KeyValueStoreGenServer.get(pid, :some_key)
  end
end
