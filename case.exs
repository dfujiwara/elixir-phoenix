defmodule Users do
  dave = %{ name: "Dave", state: "TX", likes: "programming", age: 27}

  case dave do
    %{age: age} = person when is_number(age) and age >= 21 -> IO.puts "You can drink at age #{age}, #{person.name}"
    %{state: some_state} = person -> IO.puts "#{person.name} lives in #{some_state}"
    _ -> "No matches"
  end
end
