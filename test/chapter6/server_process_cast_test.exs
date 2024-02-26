defmodule ServerProcessCastTest do
  use ExUnit.Case

  test "key value store server cast" do
    pid = KeyValueStoreCast.start()

    KeyValueStoreCast.put(pid, :some_key1, :some_value1)

    assert :some_value1 == KeyValueStoreCast.get(pid, :some_key1)
  end
end
