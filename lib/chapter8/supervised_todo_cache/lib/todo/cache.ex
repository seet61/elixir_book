defmodule Todo.Cache do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def server_process(todo_list_name) do
    GenServer.call(__MODULE__, {:server_process, todo_list_name})
  end

  @impl GenServer
  def init(_) do
    IO.puts("Strating to-do cache")

    # Добавление локального хранилища
    Todo.Database.start_link()

    {:ok, %{}}
  end

  @impl GenServer
  def handle_call({:server_process, todo_list_name}, _, todo_servers) do
    #IO.inspect("checking #{todo_list_name}")
    case Map.fetch(todo_servers, todo_list_name) do
      {:ok, todo_server} ->
        # сервер есть в сприске
        {:reply, todo_server, todo_servers}
      :error ->
          # сервера нет в словаре
          {:ok, new_server} = Todo.Server.start(todo_list_name)
          {
            :reply,
            new_server,
            Map.put(todo_servers, todo_list_name, new_server)
          }
    end
  end
end
