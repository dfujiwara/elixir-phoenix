defmodule MyEnum do
  def all?([], _func), do: true
  def all?([head | tail], func) do 
     if func.(head) do
       all?(tail, func)
     else
       false 
     end
  end

  def each([], _func), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func) 
  end

  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head] ++ filter(tail, func)
    else
      filter(tail, func)
    end
  end

  def take([], _), do: []
  def take(_, 0), do: []
  def take([head | _], 1), do: [head]
  def take([head | tail], n), do: [head] ++ take(tail, n - 1)

  def split(list, n), do: _split(list, n, [])
  defp _split([], _, acc), do: {acc, []}
  defp _split([head | tail], 1, acc), do: {acc ++ [head], tail}
  defp _split([head | tail], n, acc) do 
    _split(tail, n - 1, acc ++ [head])
  end
end
