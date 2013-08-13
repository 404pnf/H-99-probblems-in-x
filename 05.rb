=begin
5 Problem 5
(*) Reverse a list.

Example in Haskell:

Prelude> myReverse "A man, a plan, a canal, panama!"
"!amanap ,lanac a ,nalp a ,nam A"
Prelude> myReverse [1,2,3,4]
[4,3,2,1]
=end

def rest coll
  coll[1..-1]
end

def reverse1 coll
  coll.reverse
end

def reverse2 coll
  if coll.empty?
    nil
  else
    [coll[0]].concat(rest coll)
  end
end

require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_reverse1
    assert_equal [4,3,2,1], reverse1([1,2,3,4])
    assert_equal "!amanap ,lanac a ,nalp a ,nam A", reverse1("A man, a plan, a canal, panama!") 
  end
  def test_reverse2
   # assert_equal [4,3,2,1], reverse2([1,2,3,4])
    #assert_equal "!amanap ,lanac a ,nalp a ,nam A", reverse2("A man, a plan, a canal, panama!") 
  end
end