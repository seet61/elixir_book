defmodule ProcessBottleneckTest do
  use ExUnit.Case

  test "test echo" do
    server = ProcessBottleneck.start()

    Enum.each(
      1 .. 5,
      fn item ->
        spawn(
          fn ->
            IO.puts("Sending msg ##{item}")
            response = ProcessBottleneck.send_msg(server, item)
            IO.puts("Response: #{response}")
          end
        )
      end
    )
  end
end
