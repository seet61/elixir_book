defmodule Chapter4.SimpleTodo do
  @moduledoc """
  Example ToDo module
  """

  def new() do
    %{}
  end

  def add_entry(todo_list, date, title) do
    Map.update(
      todo_list,
      date,
      [title],
      fn titles -> [title | titles] end
    )
  end

  def entries(todo_list, date) do
    Map.get(todo_list, date, [])
  end
end
