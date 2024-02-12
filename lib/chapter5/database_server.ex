defmodule DatabaseServer do
  # Интерфейс запуска
  def start do
    spawn(&loop/0)
  end

  # Приватная функция выполнения сервера
  defp loop do
    receive do
      {:run_query, caller, query_def} ->
        send(caller, {:query_result, run_query(query_def)})
    end

    loop()
  end

  # Запуск обработчика
  defp run_query(query_def) do
    Process.sleep(2000)
    "#{query_def} result"
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
