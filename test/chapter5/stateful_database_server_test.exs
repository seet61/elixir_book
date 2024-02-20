defmodule DatabaseServerConnectTest do
  use ExUnit.Case

  test "check connection example test" do
    server_pid = DatabaseServerConnect.start()

    DatabaseServerConnect.run_async(server_pid, "select 1")
    IO.inspect(DatabaseServerConnect.get_result())

    DatabaseServerConnect.run_async(server_pid, "select 2")
    IO.inspect(DatabaseServerConnect.get_result())

    DatabaseServerConnect.run_async(server_pid, "select 3")
    IO.inspect(DatabaseServerConnect.get_result())
  end

end
