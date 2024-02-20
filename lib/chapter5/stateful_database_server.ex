defmodule DatabaseServerConnect do
  # Интерфейс запуска
  # Тестовый пример, берем рандомное числа, когбуд-то порт
  def start do
    spawn(fn ->
      connection = :rand.uniform(1000)
      loop(connection)
    end)
  end

  # Приватная функция выполнения сервера
  # Работаем с состоянием коннекции
  defp loop(connection) do
    receive do
      {:run_query, from_pid, query_def} ->
        # используем подключение для выполнения запроса
        query_result = run_query(connection, query_def)
        send(from_pid, {:query_result, query_result})
    end

    # Сохранение состояния в аргементе функции loop
    loop(connection)
  end

  # Запуск обработчика
  defp run_query(connection, query_def) do
    Process.sleep(2000)
    "Connection #{connection}: #{query_def} result"
  end

  # Функция вызова сервера
  def run_async(server_pid, query_def) do
    send(server_pid, {:run_query, self(), query_def})
  end

  # Функция получения результата от сервера
  def get_result() do
    receive do
      {:query_result, result} ->
        result
    after
      5000 ->
        {:error, :timeout}
    end
  end
end
