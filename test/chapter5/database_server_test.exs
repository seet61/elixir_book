defmodule DatabaseServerTest do
  use ExUnit.Case

  test "check connection" do
    IO.inspect("check connection")
    server_pid = DatabaseServer.start()

    DatabaseServer.run_async(server_pid, "query 1")
    result = DatabaseServer.get_result()
    IO.inspect(result)

    assert "query 1 result" == result

    DatabaseServer.run_async(server_pid, "query 21")
    result = DatabaseServer.get_result()
    IO.inspect(result)

    assert "query 21 result" == result
  end

  test "pool example" do
    IO.inspect("pool example")
    pool = Enum.map(
      1 .. 100,
      fn _ -> DatabaseServer.start() end
    )

    Enum.each(
      1 .. 5,
      fn query_def ->
        server_pid = Enum.at(pool, :rand.uniform(100) - 1)
        DatabaseServer.run_async(server_pid, query_def)
      end
    )

    Enum.map(
      1 .. 5,
      fn _ ->
        DatabaseServer.get_result()
      end)
    |> IO.inspect
  end
end
