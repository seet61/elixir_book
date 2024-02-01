defmodule ListHelperRange do
  @moduledoc """
  Return list with values from range a & b

  функция range/ 2, принимающая два целых числа from и to и возвращающая список всех чисел, находящихся в заданном интервале;
  """

  #Тут сама внешняя функция которую будем вызывать
  @spec range(number, number) :: [number]
  def range(a, b) do
    do_range(a, b, [])
  end

  #Тут описываем правила остановки рекурсии
  defp do_range(a, b, list) when a > b do
    list
  end

  #сама рекурсия
  defp do_range(a, b, list) when a <= b do
    do_range(a, b - 1, [ b | list])
  end


  def range() do
    {:error, "no such handler for this type of a|b"}
  end
end
