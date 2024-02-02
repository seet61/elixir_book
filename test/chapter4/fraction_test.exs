defmodule Chapter4.FractionTest do
  alias Chapter4.Fraction
  use ExUnit.Case

  test "check fraction example" do
    one_half = %Fraction{a: 1, b: 2}
    assert one_half.a == 1
    assert one_half.b == 2
  end

  test "check sum" do
    result = Fraction.add(Fraction.new(1, 2), Fraction.new(1, 4))
      |> Fraction.value
    assert result == 0.75
  end
end
