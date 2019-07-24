defmodule IntAsWordsTest do
  use ExUnit.Case
  doctest IntAsWords
  import IntAsWords

  describe "as_words/1" do
    test "0 to 19" do
      assert as_words(0) == "zero"
      assert as_words(1) == "one"
      assert as_words(2) == "two"
      assert as_words(3) == "three"
      assert as_words(4) == "four"
      assert as_words(5) == "five"
      assert as_words(6) == "six"
      assert as_words(7) == "seven"
      assert as_words(8) == "eight"
      assert as_words(9) == "nine"
      assert as_words(10) == "ten"
      assert as_words(11) == "eleven"
      assert as_words(12) == "twelve"
      assert as_words(13) == "thirteen"
      assert as_words(14) == "fourteen"
      assert as_words(15) == "fifteen"
      assert as_words(16) == "sixteen"
      assert as_words(17) == "seventeen"
      assert as_words(18) == "eighteen"
      assert as_words(19) == "nineteen"
    end

    test "20 to 99" do
      assert as_words(20) == "twenty"
      assert as_words(21) == "twenty one"
      assert as_words(29) == "twenty nine"
      assert as_words(55) == "fifty five"
      assert as_words(60) == "sixty"
      assert as_words(99) == "ninety nine"
    end

    test "100 to 999" do
      assert as_words(100) == "one hundred"
      assert as_words(111) == "one hundred eleven"
      assert as_words(123) == "one hundred twenty three"
      assert as_words(999) == "nine hundred ninety nine"
    end

    test "1000 to 999999" do
      assert as_words(1000) == "one thousand"
      assert as_words(1001) == "one thousand one"
      assert as_words(1011) == "one thousand eleven"
      assert as_words(1111) == "one thousand one hundred eleven"
      assert as_words(9999) == "nine thousand nine hundred ninety nine"
      assert as_words(10000) == "ten thousand"
      assert as_words(11000) == "eleven thousand"
      assert as_words(11100) == "eleven thousand one hundred"
      assert as_words(11010) == "eleven thousand ten"
      assert as_words(11001) == "eleven thousand one"
      assert as_words(11011) == "eleven thousand eleven"
      assert as_words(11111) == "eleven thousand one hundred eleven"
      assert as_words(99999) == "ninety nine thousand nine hundred ninety nine"
      assert as_words(160_160) == "one hundred sixty thousand one hundred sixty"
      assert as_words(999_999) == "nine hundred ninety nine thousand nine hundred ninety nine"
    end

    test "1_000_000+" do
      assert as_words(1_000_000) == "one million"
      assert as_words(1_000_001) == "one million one"
      assert as_words(1_001_001) == "one million one thousand one"
      assert as_words(1_111_111) == "one million one hundred eleven thousand one hundred eleven"

      assert as_words(9_999_999) ==
               "nine million nine hundred ninety nine thousand nine hundred ninety nine"

      assert as_words(999_999_999_999) ==
               "nine hundred ninety nine billion nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine"
    end
  end

  test "with_words/1" do
    assert with_words(1) == "1 (one)"

    assert with_words(999_999_999_999) ==
             "999999999999 (nine hundred ninety nine billion nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine)"
  end
end
