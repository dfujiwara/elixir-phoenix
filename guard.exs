defmodule Guard do
  def what_is(x) when is_number(x) do
    IO.puts "number"
  end
  def what_is(x) when is_list(x) do
    IO.puts "list"
  end
  def what_is(x) when is_atom(x) do
    IO.puts "atom"
  end
end
