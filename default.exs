defmodule Example do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end
end

defmodule DefaultParams do
  def func(p1, p2 \\ 123)
  def func(p1, 99), do: "you said 99"
  def func(p1, p2), do: IO.inspect [p1, p2]
end
