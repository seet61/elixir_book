defmodule Todo.System do
  @moduledoc """
  8.3.4. Обертка супервизора
  """

  def start_link do
    Supervisor.start_link(
      [Todo.Cache],
      strategy: :one_for_one
    )
  end
end
