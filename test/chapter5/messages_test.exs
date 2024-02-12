defmodule MessagesTest do
  use ExUnit.Case

  test "send message example" do
    IO.inspect("send message example")
    send(self(), {:message, 1})
    receive_result = receive do
      {:message, value} ->
        value + 2
    end

    IO.inspect(receive_result)
  end

  test "async send caller result" do
    IO.inspect("async send caller result")
    run_query =
      fn query_def ->
        Process.sleep(2000)
        "#{query_def} result"
      end

    async_query =
      fn query_def ->
        caller = self()
        spawn(
          fn ->
            send(caller, {:query_result, run_query.(query_def)})
          end)
      end

    Enum.each(
      1 ..5,
      fn item ->
        async_query.("query #{item}")
      end
    )

    get_result =
      fn ->
        receive do
          {:query_result, result} ->
            result
        end
      end

    results = Enum.map(
      1 .. 5,
      fn _ ->
        get_result.()
      end
    )

    IO.inspect(results)
  end


end
