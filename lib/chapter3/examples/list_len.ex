defmodule ListHelper do
  @moduledoc """
  Retrun count of elements at list

  функция list_len/ 1 , вычисляющая длину списка;
  """

  def list_len(list) do
    do_list_len(0, list)
  end

  defp do_list_len(cnt, []) do
    cnt
  end

  defp do_list_len(cnt, [ _ | tail ]) do
    do_list_len(cnt + 1, tail)
  end

end
