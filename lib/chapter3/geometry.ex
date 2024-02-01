defmodule Geometry do
  @pi 3.14

  @moduledoc """
    Some test Geometry module
  """

  @spec area({:rectangle, number, number}) :: number
  def area({:rectangle, a, b}) do
    a * b
  end

  @spec area({:square, number}) :: number
  def area({:square, a}) do
    a * a
  end

  @spec area({:circle, number}) :: number
  def area({:circle, r}) do
    r * r * @pi
  end

  def area(unknown) do
    {:error, {:unknown_shape, unknown}}
  end
end
