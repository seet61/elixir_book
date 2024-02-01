defmodule TestList do
  @moduledoc """
    TestList
  """

  def empty?([]) do
    true
  end

  def empty?([_|_]) do
    false
  end
end
