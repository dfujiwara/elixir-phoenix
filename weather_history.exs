defmodule WeatherHistory do
  def for_location([], _target_loc), do: []
  def for_location([ head = [_, target_loc, _, _ | tail]), do: [head | for_location(tail, target_loc)]
  def for_location([_, tail], target_loc), do: for_location(tail, target_loc)
end
