defmodule Greeter do 
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_) -> "I don't know you"
    end
  end
end

mr_valim = Greeter.for("Jose", "OI!")

IO.puts mr_valim.("Jose")
IO.puts mr_valim.("hi")
