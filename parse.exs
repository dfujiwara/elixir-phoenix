defmodule Parse do
  def number([?- | tail]) do
    _number_digit(tail, 0) * -1
  end
  def number([?+ | tail]), do: _number_digit(tail, 0)
  def number(str), do: _number_digit(str, 0)
  defp _number_digit([], value), do: value
  defp _number_digit([head | tail], value) when head in '0123456789' do
    _number_digit(tail, value * 10 + head - ?0)
  end
  defp _number_digit([non_digit | _], _), do: raise "non value #{[non_digit]}"
    
  def ascii([]), do: false
  def ascii([e]), do: e >= 32 and e <= 126
  def ascii([head | tail]) when head >= 32 and head <= 126, do: ascii(tail) 
  def ascii([_ | _]), do: false

  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)
end

