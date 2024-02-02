defmodule Chapter4.TodoCrudTest do
  alias Chapter4.TodoCrud
  use ExUnit.Case

  test "check todo_crud example" do
    todo_crud = TodoCrud.new()
    |> TodoCrud.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
    |> TodoCrud.add_entry(%{date: ~D[2018-12-20], title: "Shopping"})
    |> TodoCrud.add_entry(%{date: ~D[2018-12-19], title: "Movies"})

    todo_result = TodoCrud.entries(todo_crud, ~D[2018-12-19])
    IO.inspect(todo_result)
  end
end
