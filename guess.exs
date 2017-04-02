defmodule Guess do
  def guess(actual, range) do
    narrow(actual, range, div(range.last + range.first, 2))
  end
  def narrow(actual, _, guess) when actual == guess do actual end
  def narrow(actual, range, guess) when guess > actual do
    new_range = range.first..guess - 1
    mid = div(range.first + guess, 2)
    IO.puts "Is it #{mid}"
    narrow(actual, new_range, mid) 
  end
  def narrow(actual, range, guess) when guess < actual do
    new_range = guess + 1..range.last
    mid = div(range.last + guess, 2)
    IO.puts "Is it #{mid}"
    narrow(actual, new_range, mid)
  end 
end
