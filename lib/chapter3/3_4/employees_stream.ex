defmodule EmployeesStream do
  def print(list) do
    list
      |> Stream.with_index
      |> Enum.each(fn {employee, index} ->
        IO.puts("#{index + 1}. #{employee}")
      end)
  end
end
