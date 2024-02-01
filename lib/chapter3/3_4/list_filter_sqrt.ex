defmodule ListFilterSqrt do

  def print(list) do
    list
      |> Stream.filter(&(is_number(&1) and &1 > 0))
      |> Stream.map(&{&1, :math.sqrt(&1)})
      |> Stream.with_index
      |> Enum.each(
        fn {{input, result}, index} ->
          IO.puts("#{index + 1}. sqrt(#{input}) = #{result}")
        end
      )
  end
end
