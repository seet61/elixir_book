defmodule ServerProcessCast do
  @moduledoc """
  Серверный процесс cast главан 6.1.4
  """

  def start(callback_module) do
    spawn(fn ->
      # Использование обратного вызова для инициализации сосотояния
      initial_state = callback_module.init()
      loop(callback_module, initial_state)
    end)
  end

  def call(server_pid, request) do
    # Указание запроса call
    send(server_pid, {:call, request, self()})

    receive do
      # Ожидание ответа
      {:response, response} ->
        # Возвращаем ответа
        response
    end
  end

  def cast(server_pid, request) do
    # Указание запроса cast
    send(server_pid, {:cast, request})
  end

  defp loop(callback_module, current_state) do
    receive do
      {:call, request, caller} ->
        # Обработка запроса call
        # использование функции обратного вызова для обработки сообщения
        {response, new_state} = callback_module.handle_call(
          request,
          current_state
        )

        # Передача ответа
        send(caller, {:response, response})

        # Запуск цикла с новым состоянием
        loop(callback_module, new_state)
      {:cast, request} ->
        # Обработка запроса cast
        new_state = callback_module.handle_cast(request, current_state)
        loop(callback_module, new_state)
    end
  end
end

defmodule KeyValueStoreCast do
  # ServerProcess интегрирован в KeyValueStore
  def start do
    ServerProcessCast.start(KeyValueStoreCast)
  end

  def put(pid, key, value) do
    ServerProcessCast.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    ServerProcessCast.call(pid, {:get, key})
  end

  # Начальное состояние инициализации
  def init do
    %{}
  end

  # Обработка запроса типа put
  def handle_cast({:put, key, value}, state) do
    Map.put(state, key, value)
  end

  # Обработка запроса типа get
  def handle_call({:get, key}, state) do
    {Map.get(state, key), state}
  end

end
