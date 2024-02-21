defmodule ProcessBottleneckTest do
  use ExUnit.Case

  test "echo1" do
    server = ProcessBottleneck.start()

    Enum.each(
      1..5,
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

    Process.sleep(5000)
  end

  test "echo2" do
    server = ProcessBottleneck.start()

    Enum.each(
      1..5,
      fn item ->
        IO.puts("Sending msg ##{item}")
        response = ProcessBottleneck.send_msg(server, item)
        IO.puts("Response: #{response}")
        #Process.sleep(1000)
      end
    )
  end
end
