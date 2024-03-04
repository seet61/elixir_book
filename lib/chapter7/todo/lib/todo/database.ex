defmodule Todo.Database do
  @moduledoc """
  7.3.1. Кодирование и сохранение
  """

  use GenServer

  @db_folder "./persist"

  def start() do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def store(key, data) do
    IO.inspect("store #{key}")
    IO.inspect(data)
    GenServer.cast(__MODULE__, {:store, key, data})
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  def init(_) do
    # Проверяем что такой каталог существует
    File.mkdir_p!(@db_folder)
    {:ok, nil}
  end

  def handle_cast({:store, key, data}, state) do
    # Обработчик сохранения
    key
    |> file_name()
    |> File.write!(:erlang.term_to_binary(data))

    {:noreply, state}
  end

  def handle_call({:get, key}, _, state) do
    data = case File.read(file_name(key)) do
      {:ok, contents} -> :erlang.binary_to_term(contents)
      _ -> nil
    end

    {:reply, data, state}
  end

  defp file_name(key) do
    Path.join(@db_folder, to_string(key))
  end
end
