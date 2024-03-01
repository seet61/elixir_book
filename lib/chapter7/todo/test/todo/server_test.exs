defmodule Todo.ServerTest do
  use ExUnit.Case
  #doctest Todo

  test "check todo server" do
    {:ok, todo_list} = Todo.Server.start()

    IO.inspect(todo_list)

    Todo.Server.add_entry(todo_list, %{date: ~D[2018-12-19], title: "Dentist"})
    Todo.Server.add_entry(todo_list, %{date: ~D[2018-12-20], title: "Shopping"})
    Todo.Server.add_entry(todo_list, %{date: ~D[2018-12-19], title: "Movies"})

    IO.inspect(Todo.Server.size(todo_list))

    todo_result = Todo.Server.entries(todo_list, ~D[2018-12-20])
    IO.inspect(todo_result)

    assert [%{id: 2, date: ~D[2018-12-20], title: "Shopping"}] == todo_result
  end
end
