defmodule NaturalNums do
  @moduledoc """
  Printing natural nums from m
  """

  def print(1) do
    IO.puts(1)
  end

  def print(n) when n > 1 do
    print(n - 1)
    IO.puts(n)
  end

  def print(_) do
    IO.puts("n should be more than 0")
  end

end
