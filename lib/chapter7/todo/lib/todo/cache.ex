defmodule Todo.Cache do
  use GenServer

  def start do
    GenServer.start(__MODULE__, nil)
  end

  def server_process(cache_pid, todo_list_name) do
    GenServer.call(cache_pid, {:server_process, todo_list_name})
  end

  @impl GenServer
  def init(_) do
    # Добавление локального хранилища
    Todo.Database.start()

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
