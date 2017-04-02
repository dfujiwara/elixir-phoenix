defmodule MyComprehensions do
  def span(from, to) when from > to, do: []
  def span(from, to) do
    for x <- from..to, do: x
  end

  def prime(from, to) do
    range = span(from, to)
    range -- (for x <- range, y <- range, x <= y, x * y <= to, do: x * y)
  end

  def total_sales(orders, rates) do
    for [id: _, ship_to: state, net_amount: net_amount] = order <- orders do
       if rates[state] != nil do
          Keyword.put_new(order, :total_amount, net_amount * ( 1 + rates[state]))
       else
          Keyword.put_new(order, :total_amount, net_amount)
       end 
    end
  end
end
