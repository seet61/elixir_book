defmodule ListHelperPositive do
  @moduledoc """
  Return list only with positive numbers

  функция positive/ 1 , принимающая список и возвращающая другой список, содержащий только положительные числа исходного списка.
  """

  # Основаня функция для вызова
  @spec positive([number]) :: [number]
  def positive(list) do
    :lists.reverse(do_positive([], list))
  end

  # Останов при пустом массиве обработки
  defp do_positive(cur_list, []) do
    cur_list
  end

  # Исключаем отризательные
  defp do_positive(cur_list, [head | tail ]) when head < 0 do
    do_positive(cur_list, tail)
  end

  # Рекурсия для позитивных
  defp do_positive(cur_list, [head | tail]) when head >= 0 do
    do_positive([head | cur_list], tail)
  end

end
