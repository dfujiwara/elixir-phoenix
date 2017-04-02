defmodule Mod do
  def func1 do
    IO.puts "in func1"
  end
  def func2 do
    func1()
    IO.puts "in func2"
  end
end

Mod.func1
Mod.func2


defmodule Outer do
  defmodule Inner do
    def inner_func do
    end
  end
  def outer_func do
    Inner.inner_func
  end
end

Outer.outer_func
Outer.Inner.inner_func

defmodule Example do
  def func1 do
    List.flatten [1, [2,3], 4]
  end
  def func2 do
    import List, only: [flatten: 1]
    flatten [5, [6, 7], 8]
  end
end

IO.puts Example.func1
IO.puts Example.func2
