defmodule Chapter4.TodoMultiDict do
  def new() do
    %{}
  end

  def add(dict, key, value) do
    Map.update(dict, key, [value], fn values -> [value | values] end)
  end

  def get(dict, key) do
    Map.get(dict, key, [])
  end
end
