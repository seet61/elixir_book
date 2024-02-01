defmodule ListHelper do
  @moduledoc """
  Retrun sum of all elements at list of numbers
  """

  def sum([]) do
    0
  end

  def sum([head | tail]) do
    head + sum(tail)
  end
end
