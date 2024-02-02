defmodule FilesHelperTest do
  use ExUnit.Case

  test "check MapSet" do
    days =
      MapSet.new()
      |> MapSet.put(:monday)
      |> MapSet.put(:tuesday)
      |> MapSet.put(:wensday)

    check_day = MapSet.member?(days, :monday)
    assert check_day == true
  end
end
