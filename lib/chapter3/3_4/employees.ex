defmodule Employees do
  def print(list) do
    list
      |> Enum.with_index
      |> Enum.each(
        fn {employee, index} ->
          IO.puts("#{index + 1}. #{employee}")
        end
      )
  end
end
