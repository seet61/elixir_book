defmodule Todo.System do
  @moduledoc """
  8.3.4. Обертка супервизора
  """
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, nil)
  end

  def init(_) do
    Supervisor.init(
      [Todo.Cache],
      strategy: :one_for_one
    )
  end
end
