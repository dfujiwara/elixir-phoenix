defmodule Exclamation do
   def ok!({:ok, data}), do: data 
   def ok!({error, message}), do: raise("#{error}, #{message}")
   def ok!(_), do: raise "Invalid"
end
