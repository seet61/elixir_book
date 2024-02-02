defmodule Chapter4.AdditionalFuncTest do
  use ExUnit.Case

  test "put_in example" do
    todo_list = %{
      1 => %{date: ~D[2018-12-19], title: "Dentist"},
      2 => %{date: ~D[2018-12-20], title: "Shopping"},
      3 => %{date: ~D[2018-12-19], title: "Movies"}
    }

    IO.inspect(todo_list)

    todo_list_new = put_in(todo_list[3].title, "Theater")
    IO.inspect(todo_list_new)

    path = [3, :title]
    todo_list_new = put_in(todo_list, path, "TheaterBig")
    IO.inspect(todo_list_new)


  end

end
