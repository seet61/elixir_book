defmodule KeyValueStoreGenServerTest do
  use ExUnit.Case

  test "key value GenServer example" do
    KeyValueStoreGenServer.start()

    KeyValueStoreGenServer.put(:some_key, :some_value)

    assert :some_value == KeyValueStoreGenServer.get(:some_key)
  end
end
