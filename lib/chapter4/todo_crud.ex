defmodule Chapter4.TodoCrud do
  alias Chapter4.TodoCrud
  defstruct auto_id: 1, entries: %{}

  def new() do
    %TodoCrud{}
  end

  def add_entry(todo_crud, entry) do
    entry = Map.put(entry, :id, todo_crud.auto_id)

    new_entries = Map.put(
      todo_crud.entries,
      todo_crud.auto_id,
      entry
    )

    %TodoCrud{todo_crud |
      entries: new_entries,
      auto_id: todo_crud.auto_id + 1
    }
  end


  def entries(todo_crud, date) do
    todo_crud.entries
    |> Stream.filter(
      fn {_, entry} ->
        entry.date == date
      end
    )
    |> Enum.map(
      fn {_, entry} ->
        entry
      end
    )
  end

  def update_entry(todo_crud, entry_id, updater_fun) do
    case Map.fetch(todo_crud.entries, entry_id) do
      :error ->
        #не нашли совпадение возващаем то что есть
        todo_crud
      {:ok, old_entry} ->
        #нашли запись, надо поправить
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(todo_crud.entries, new_entry.id, new_entry)
        %TodoCrud{todo_crud | entries: new_entries}
    end
  end

  def delete_entry(todo_crud, entry_id) do

    new_entries = Map.delete(
      todo_crud.entries,
      entry_id
    )

    %TodoCrud{todo_crud |
      entries: new_entries
    }
  end

end
