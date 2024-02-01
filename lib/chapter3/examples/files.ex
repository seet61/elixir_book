defmodule FilesHelper do
  @moduledoc """
  Реализуйте следующие функции, используя large_lines!/ 1 в качестве модели:

  lines_lengths!/ 1 , принимающую на вход путь к файлу и возвращающую спи - сок чисел, где каждое число – это длина соответствующей строки файла;
  longest_line_length!/ 1, возвращающую размер самой длинной строки;
  longest_line!/ 1 , возвращающую содержимое самой длинной строки файла;
  words_per_line!/ 1, возвращающую список чисел, каждое из которых обозна - чает количество слов в строке
    (чтобы посчитать слова в строке, используйте функцию length(String.split(line) ).
  """

  #@spec large_lines!(string) :: charlist
  def large_lines!(path) do
    File.stream!(path)
      |> Stream.map(&String.replace(&1, "\n", ""))
      |> Enum.filter(&(String.length(&1) > 100))
  end

  def lines_lengths!(path) do
    File.stream!(path)
      |> Stream.map(fn item ->
        item
        |> String.replace("\n", "")
        |> String.length
        end)
      |> Stream.with_index
      |> Enum.each(
        fn {count, idx} ->
          IO.puts("#{idx + 1}. has #{count} symbols")
        end
      )
  end

  def longest_line_length!(path) do
    File.stream!(path)
      |> Stream.map(fn item ->
        item
        |> String.replace("\n", "")
        |> String.length
        end)
      |> Enum.max
  end

end
