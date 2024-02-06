defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},
      fn entry, todo_acc ->
        add_entry(todo_acc, entry)
      end
    )
  end

  def add_entry(todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.auto_id)

    new_entries = Map.put(
      todo_list.entries,
      todo_list.auto_id,
      entry
    )

    %TodoList{todo_list |
      entries: new_entries,
      auto_id: todo_list.auto_id + 1
    }
  end

  def entries(todo_list, date) do
    todo_list.entries
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

  def update_entry(todo_list, entry_id, updater_fun) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error ->
        #не нашли совпадение возващаем то что есть
        todo_list
      {:ok, old_entry} ->
        #нашли запись, надо поправить
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry(todo_list, entry_id) do

    new_entries = Map.delete(
      todo_list.entries,
      entry_id
    )

    %TodoList{todo_list |
      entries: new_entries
    }
  end
end

defmodule TodoList.CsvImporter do
  def import(path) do
    path
    |> read_file()
    |> convert_to_map
    |> TodoList.new()
  end

  def read_file(path) do
    path
    |> File.stream!
    |> Stream.map(fn item ->
      String.replace(item, "\n", "")
    end)
  end

  def convert_to_map(lines) do
    Stream.map(
      lines,
      fn line ->
        #разбираем строку на части
        [date_string, title] = String.split(line, ",")
        #парсим строку даты
        date = Date.from_iso8601!(date_string)
        #собираем все в мапу
        %{date: date, title: title}
      end
    )

  end
end
