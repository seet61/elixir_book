defmodule Fact do

  def fact(0) do
    1
  end

  def fact(x) do
    x * fact(x - 1)
  end
end
