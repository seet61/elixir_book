defmodule TodoListTest do
  use ExUnit.Case

  test "todo_builder new example" do
    IO.inspect("check todo_crud example")

    entries = [
      %{date: ~D[2018-12-19], title: "Dentist"},
      %{date: ~D[2018-12-20], title: "Shopping"},
      %{date: ~D[2018-12-19], title: "Movies"}
    ]

    todo_list = TodoList.new(entries)

    IO.inspect(todo_list)
  end

  test "todo_builder importer test" do
    IO.inspect("todo_builder importer test")
    todo_list = TodoList.CsvImporter.import("./lib/chapter4/todos.csv")

    IO.inspect(todo_list)
  end

end
