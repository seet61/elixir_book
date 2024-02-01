defmodule TestNum do
  @moduledoc """
    test limiter
  """

  @doc """
    test value of x
  """
  @spec test(number) :: atom
  def test(x) when is_number(x) and x < 0 do
    :negative
  end

  def test(0), do: :zero

  def test(x) when is_number(x) and x > 0  do
    :positive
  end
end
