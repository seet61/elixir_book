defmodule Chapter4.TodoList do
  def new() do
    Chapter4.TodoMultiDict.new()
  end

  def add_entry(todo_list, date, title) do
    Chapter4.TodoMultiDict.add(todo_list, date, title)
  end

  def entries(todo_list, date) do
    Chapter4.TodoMultiDict.get(todo_list, date)
  end
end
