defmodule ToDoServer do
  @moduledoc """
  6.2.8. Упражнение: создание сервера для списка дел на основе GenServer
  """
  use GenServer

  defstruct auto_id: 1, entries: %{}

  def start do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def put(entry) do
    GenServer.cast(__MODULE__, {:put, entry})
  end

  def get(date) do
    GenServer.call(__MODULE__, {:get, date})
  end

  @impl GenServer
  def init(_) do
    {:ok, %ToDoServer{}}
  end

  @impl GenServer
  def handle_cast({:put, entry}, todo_server) do
    entry = Map.put(entry, :id, todo_server.auto_id)

    new_entries = Map.put(
      todo_server.entries,
      todo_server.auto_id,
      entry
    )

    new_todo_server = %ToDoServer{todo_server |
      entries: new_entries,
      auto_id: todo_server.auto_id + 1
    }

    {:noreply, new_todo_server}
  end

  @impl GenServer
  def handle_call({:get, date}, _, todo_server) do
    entries = todo_server.entries
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

    {:reply, entries, todo_server}
  end

end
