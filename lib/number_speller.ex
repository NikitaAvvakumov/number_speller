defmodule NumberSpeller do
  def as_words(0), do: "zero"

  def as_words(int) when is_integer(int) do
    int
    |> Integer.to_string()
    |> String.graphemes()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.map(&Enum.reverse/1)
    |> Enum.with_index()
    |> Enum.map(&wordify/1)
    |> Enum.reverse()
    |> join_non_null()
  end

  def with_words(int) when is_integer(int) do
    "#{int} (#{as_words(int)})"
  end

  defp wordify({["0"], _index}), do: nil
  defp wordify({["0", "0"], _index}), do: nil
  defp wordify({["0", "0", "0"], _index}), do: nil

  defp wordify({["0", "0", o], index}), do: wordify({[o], index})
  defp wordify({["0", t, o], index}), do: wordify({[t, o], index})

  defp wordify({[o], index}), do: [number_word(o), ordinal(index)] |> join_non_null()

  defp wordify({[t, "0"], index}), do: [number_word(t <> "0"), ordinal(index)] |> join_non_null()

  defp wordify({["1", o], index}), do: [number_word("1#{o}"), ordinal(index)] |> join_non_null()

  defp wordify({[t, o], index}),
    do: ["#{number_word(t <> "0")} #{number_word(o)}", ordinal(index)] |> join_non_null()

  defp wordify({[h, t, o], index}),
    do: ["#{number_word(h)} hundred", wordify({[t, o], index})] |> join_non_null()

  defp number_word(i) do
    %{
      "0" => nil,
      "1" => "one",
      "2" => "two",
      "3" => "three",
      "4" => "four",
      "5" => "five",
      "6" => "six",
      "7" => "seven",
      "8" => "eight",
      "9" => "nine",
      "10" => "ten",
      "11" => "eleven",
      "12" => "twelve",
      "13" => "thirteen",
      "14" => "fourteen",
      "15" => "fifteen",
      "16" => "sixteen",
      "17" => "seventeen",
      "18" => "eighteen",
      "19" => "nineteen",
      "20" => "twenty",
      "30" => "thirty",
      "40" => "fourty",
      "50" => "fifty",
      "60" => "sixty",
      "70" => "seventy",
      "80" => "eighty",
      "90" => "ninety"
    }[i]
  end

  defp ordinal(index) do
    %{
      0 => nil,
      1 => "thousand",
      2 => "million",
      3 => "billion",
      4 => "trillion",
      5 => "quadrillion",
      6 => "quintillion",
      7 => "sextillion",
      8 => "septillion",
      9 => "octillion",
      10 => "nonillion"
    }[index]
  end

  defp join_non_null(list) when is_list(list) do
    list |> Enum.reject(&is_nil/1) |> Enum.join(" ")
  end
end
