defmodule ListHelper1 do

  def sum([]) do
    0
  end

  def sum([head | tail]) do
    head + sum(tail)
  end
end
