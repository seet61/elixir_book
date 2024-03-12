defmodule Todo.DatabaseWorker do
  @moduledoc """
  воркер
  """

  use GenServer

  def start(db_folder) do
    GenServer.start(__MODULE__, db_folder)
  end

  def store(worker_pid, key, data) do
    IO.inspect("store #{to_string(worker_pid |> :erlang.pid_to_list())}")
    GenServer.cast(worker_pid, {:store, key, data})
  end

  def get(worker_pid, key) do
    IO.inspect("get #{to_string(worker_pid |> :erlang.pid_to_list())}")
    GenServer.call(worker_pid, {:get, key})
  end

  @impl GenServer
  def init(db_folder) do
    IO.puts("Starting to-do database worker")
    {:ok, db_folder}
  end

  @impl GenServer
  def handle_cast({:store, key, data}, db_folder) do
    # Обработчик сохранения
    db_folder
    |> file_name(key)
    |> File.write!(:erlang.term_to_binary(data))

    {:noreply, db_folder}
  end

  @impl GenServer
  def handle_call({:get, key}, _, db_folder) do
    # Создаем отдельный процесс обработки :get запроса
    data = case File.read(file_name(db_folder, key)) do
      {:ok, contents} -> :erlang.binary_to_term(contents)
      _ -> nil
    end

    {:reply, data, db_folder}
  end

  defp file_name(db_folder, key) do
    Path.join(db_folder, to_string(key))
  end
end
