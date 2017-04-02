defmodule Swapper do
  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise "Can't swap a list with an odd number of elements"
end

defmodule Reverse do
  def reverse([]), do: []
  def reverse([a]), do: [a]
  def reverse([head | tail]), do: reverse(tail) ++ [head]
end
