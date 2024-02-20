defmodule CalculatorTest do
  use ExUnit.Case

  test "test1 calculator" do
    calculator_pid = Calculator.start()

    IO.inspect(Calculator.value(calculator_pid))

    Calculator.add(calculator_pid, 10)
    Calculator.sub(calculator_pid, 5)
    Calculator.mul(calculator_pid, 3)
    Calculator.div(calculator_pid, 5)

    IO.inspect(Calculator.value(calculator_pid))
  end
end
