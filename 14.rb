=begin
4 Problem 14
(*) Duplicate the elements of a list.

Example:

* (dupli '(a b c c d))
(A A B B C C C C D D)
Example in Haskell:

> dupli [1, 2, 3]
[1,1,2,2,3,3]
=end

def dupli arr
  arr.map {|e| [e,e]}.flatten
end
require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_dupli
    assert_equal %w(A A B B C C C C D D), dupli(%w(A B C C D))
  end
end
