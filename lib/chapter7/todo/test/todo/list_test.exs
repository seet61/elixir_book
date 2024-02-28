defmodule Todo.ListTest do
  use ExUnit.Case

  test "emty list" do
    assert Todo.List.size(Todo.List.new()) == 0
  end

  test "entries" do
    todo_list =
      Todo.List.new()
      |> Todo.List.add_entry(%{date: ~D[2024-02-28], title: "Стоматолог"})
      |> Todo.List.add_entry(%{date: ~D[2024-02-27], title: "Покупки"})
      |> Todo.List.add_entry(%{date: ~D[2024-02-28], title: "Кинотеатр"})

    assert 3 == Todo.List.size(todo_list)

    assert 2 == todo_list |> Todo.List.entries(~D[2024-02-28]) |> length()
    assert 1 == todo_list |> Todo.List.entries(~D[2024-02-27]) |> length()
    assert 0 == todo_list |> Todo.List.entries(~D[2024-02-26]) |> length()

    titles = todo_list |> Todo.List.entries(~D[2024-02-28]) |> Enum.map(fn item -> item.title end)
    assert ["Стоматолог", "Кинотеатр"] == titles
  end
end
