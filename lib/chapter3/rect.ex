defmodule Rectangle do
  @moduledoc """
    Some test rectangle functions
  """

  @doc """
    Calculate rectange area
  """
  @spec area({number, number}) :: number
  def area({a, b}) do
    Enum.each([a, b], &IO.puts/1)
    a * b
  end
end
