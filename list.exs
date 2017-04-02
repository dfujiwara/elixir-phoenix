defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]
  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func)]

  def sum(list), do: _sum(list, 0)

  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, total + head)

  def new_sum([]), do: 0
  def new_sum([head | tail]), do: head + new_sum(tail)

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max([]), do: 0
  def max([element]), do: element
  def max([head | tail]), do: Kernel.max(head, max(tail))

  def caesar([], _), do: []
  def caesar([head | tail], n) when head + n <= ?z do
    [head + n | caesar(tail, n)]
  end
  def caesar([head | tail], n), do: [ head + n - 26 | caesar(tail, n)]

  def span(from, from), do: [from]
  def span(from, to) when from < to do
    [from | span(from + 1, to)]
  end
  def span(from, to) when from > to, do: []
end
