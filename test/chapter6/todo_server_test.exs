defmodule ToDoServerTest do
  use ExUnit.Case

  test "check todo server" do
    status = ToDoServer.start()

    IO.inspect(status)

    ToDoServer.put(%{date: ~D[2018-12-19], title: "Dentist"})
    ToDoServer.put(%{date: ~D[2018-12-20], title: "Shopping"})
    ToDoServer.put(%{date: ~D[2018-12-19], title: "Movies"})

    todo_result = ToDoServer.get(~D[2018-12-19])

    IO.inspect(todo_result)
  end
end
