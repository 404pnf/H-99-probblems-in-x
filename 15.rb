=begin
5 Problem 15
(**) Replicate the elements of a list a given number of times.

Example:

* (repli '(a b c) 3)
(A A A B B B C C C)
Example in Haskell:

> repli "abc" 3
"aaabbbccc"
=end

def repli arr, count
  arr.map do |e|
    r = []
    count.times {r << e}
    r
  end.flatten
end
require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_repli
    assert_equal %w(A A A B B B C C C), repli(%w(A B C), 3)
  end
end
