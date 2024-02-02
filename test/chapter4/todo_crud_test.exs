defmodule Chapter4.TodoCrudTest do
  alias Chapter4.TodoCrud
  use ExUnit.Case

  test "check todo_crud example" do
    IO.inspect("check todo_crud example")
    todo_crud = TodoCrud.new()
    |> TodoCrud.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
    |> TodoCrud.add_entry(%{date: ~D[2018-12-20], title: "Shopping"})
    |> TodoCrud.add_entry(%{date: ~D[2018-12-19], title: "Movies"})

    todo_result = TodoCrud.entries(todo_crud, ~D[2018-12-19])
    IO.inspect(todo_result)
  end

  test "check todo_crud update" do
    IO.inspect("check todo_crud update")
    todo_crud = TodoCrud.new()
    |> TodoCrud.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
    |> TodoCrud.add_entry(%{date: ~D[2018-12-20], title: "Shopping"})
    |> TodoCrud.add_entry(%{date: ~D[2018-12-19], title: "Movies"})

    todo_result = TodoCrud.update_entry(todo_crud, 1, &Map.put(&1, :date, ~D[2018-12-20]))
    IO.inspect(todo_result)
  end

  test "check todo_crud delete" do
    IO.inspect("check todo_crud delete")
    todo_crud = TodoCrud.new()
    |> TodoCrud.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
    |> TodoCrud.add_entry(%{date: ~D[2018-12-20], title: "Shopping"})
    |> TodoCrud.add_entry(%{date: ~D[2018-12-19], title: "Movies"})

    todo_result = TodoCrud.delete_entry(todo_crud, 1)
    IO.inspect(todo_result)
  end
end
