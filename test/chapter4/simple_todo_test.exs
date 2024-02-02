defmodule Chapter4.SimpleTodoTest do
  use ExUnit.Case

  test "check to do example" do
    todo_list =
      Chapter4.SimpleTodo.new()
      |> Chapter4.SimpleTodo.add_entry(~D[2018-12-19], "Dentist")
      |> Chapter4.SimpleTodo.add_entry(~D[2018-12-20], "Shopping")
      |> Chapter4.SimpleTodo.add_entry(~D[2018-12-19], "Movies")

    todo_list_test = []

    assert Chapter4.SimpleTodo.entries(todo_list, ~D[2018-12-18]) == todo_list_test

    todo_list_test = ["Movies", "Dentist"]

    assert Chapter4.SimpleTodo.entries(todo_list, ~D[2018-12-19]) == todo_list_test
  end
end
