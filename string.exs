defmodule MyString do
  def print(list) do
    max_length = Enum.map(list, fn x -> String.length(x) end) |> Enum.max
    for word <- list do
       length = String.length(word)
       padding = round((max_length - length) / 2)
       IO.puts String.pad_trailing(String.pad_leading(word, length + padding), length + padding * 2)
    end 
  end

  def capitalize_sentences(sentences) do
     sentences |> String.split(". ") |> Enum.map(&String.capitalize/1) |> Enum.join(". ")
  end
end
