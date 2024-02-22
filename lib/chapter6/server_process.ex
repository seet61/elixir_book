defmodule ServerProcess do
  def start(callback_module) do
    spawn(fn ->
      # Использование обратного вызова для инициализации сосотояния
      initial_state = callback_module.init()
      loop(callback_module, initial_state)
    end)
  end

  defp loop(callback_module, current_state) do
    receive do
      {request, caller} ->
        # использование функции обратного вызова для обработки сообщения
        {response, new_state} = callback_module.handle_call(
          request,
          current_state
        )

        # Передача ответа
        send(caller, {:response, response})

        # Запуск цикла с новым состоянием
        loop(callback_module, new_state)
    end
  end

  # Вспомогательная функция отправки запросов
  def call(server_pid, request) do
    # Передача сообщения серверному процессу
    send(server_pid, {request, self()})

    receive do
      # Ожидание ответа
      {:response, response} ->
        # Возвращаем ответа
        response
    end
  end
end


defmodule KeyValueStore do

  # ServerProcess интегрирован в KeyValueStore
  def start do
    ServerProcess.start(KeyValueStore)
  end

  def put(pid, key, value) do
    ServerProcess.call(pid, {:put, key, value})
  end

  def get(pid, key) do
    ServerProcess.call(pid, {:get, key})
  end

  # Начальное состояние инициализации
  def init do
    %{}
  end

  # Обработка запроса типа put
  def handle_call({:put, key, value}, state) do
    {:ok, Map.put(state, key, value)}
  end

  # Обработка запроса типа get
  def handle_call({:get, key}, state) do
    {Map.get(state, key), state}
  end

end
