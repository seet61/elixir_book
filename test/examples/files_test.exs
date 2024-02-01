defmodule FilesHelperTest do
  use ExUnit.Case
  doctest FilesHelper

  test "large_lines example" do
    IO.puts("large_lines example")
    #assert FilesHelper.hello() == :world
    result = FilesHelper.large_lines!("./test/examples/test.txt")
    IO.puts(Enum.count(result))
    assert Enum.count(result) == 15
  end

  test "get each lines length" do
    IO.puts("get each lines length")
    FilesHelper.lines_lengths!("./test/examples/test.txt")
  end
end
