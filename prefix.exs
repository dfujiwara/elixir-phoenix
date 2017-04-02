prefix = fn p -> (fn string -> "#{p} #{string}" end) end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")

IO.puts prefix.("Elixir").("Rocks")
