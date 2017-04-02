f = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, c) -> c
end

IO.puts f.(0, 1, 2)
IO.puts f.(1, 0, 2)
IO.puts f.(1, 1, 3)
  

f2 = fn (n) -> f.(rem(n, 3), rem(n, 5), n) end

IO.puts f2.(10)
IO.puts f2.(11)
IO.puts f2.(12)
IO.puts f2.(13)
IO.puts f2.(14)
IO.puts f2.(15)
IO.puts f2.(16)


defmodule FizzBuzz do
  def upto(n) when n > 0, do: _downto(n, [])
  defp _downto(0, result), do: result
  defp _downto(current, result) do
    next_answer = 
       cond do
          rem(current, 3) == 0 and rem(current, 5) == 0 ->
            "FizzBuzz"
          rem(current, 3) == 0 -> 
            "Fizz"
          rem(current, 5) == 5 ->
            "Buzz"
          true ->
            current
       end
    _downto(current - 1, [next_answer | result])
  end

  def upto_list(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)
  defp fizzbuzz(n) do
    cond do
     rem(n, 3) == 0 and rem(n, 5) == 0 -> "FizzBuzz"
     rem(n, 3) == 0 -> "Fizz"
     rem(n, 5) == 0 -> "Buzz"
     true -> n
    end
  end

  def upto_recursion(n) when n > 0, do: 1..n |> Enum.map(&_fizzbuzz/1)
  defp _fizzbuzz(n), do: _fizzwork(n, rem(n, 3), rem(n , 5))
  defp _fizzwork(_n, 0, 0), do: "FizzBuzz"
  defp _fizzwork(_n, 0, _), do: "Fizz"
  defp _fizzwork(_n, _, 0), do: "Buzz"
  defp _fizzwork(n, _, _), do: n

  def upto_case(n) when n > 0, do: 1..n |> Enum.map(&_fizzbuzz_case/1)
  defp _fizzbuzz_case(n) do
    case {n, rem(n, 3), rem(n , 5)} do
       {_, 0, 0}  -> "Fizzbuzz"
       {_, _, 0} -> "Buzz"
       {_, 0, _} -> "Fizz"
       {n, _, _} -> n
    end
  end
end
