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

  test "get largest line length" do
    IO.puts("get largest line length")
    max_length = FilesHelper.longest_line_length!("./test/examples/test.txt")
    IO.puts(max_length)
    assert max_length == 311
  end
end
