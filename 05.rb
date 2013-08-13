=begin
5 Problem 5
(*) Reverse a list.

Example in Haskell:

Prelude> myReverse "A man, a plan, a canal, panama!"
"!amanap ,lanac a ,nalp a ,nam A"
Prelude> myReverse [1,2,3,4]
[4,3,2,1]
=end

def but_last coll
  coll[0..-2]
end

def reverse1 coll
  coll.reverse
end

# 更好的方法？
def reverse4 coll
  if coll.is_a? String
    (reverse4 coll.split(//)).join
  else
    if coll.empty?
      []
    else
      [coll[-1]].concat (reverse2 (but_last coll))
    end
  end
end

# 比较好的方法
def reverse3 coll
    if coll.empty?
      coll.is_a?(String) ? '' : []
    else
      item = coll.is_a?(String) ? coll[-1] : [coll[-1]] 
      item + reverse3(but_last coll)
    end
end      

def reverse2 coll
  if coll.is_a? String
    if coll.empty?
      ''
    else
      coll[-1] << reverse2(but_last coll)
    end
  else
    if coll.empty?
      []
    else
      [coll[-1]].concat (reverse2 (but_last coll))
    end
  end
end

require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_reverse1
    assert_equal [4,3,2,1], reverse1([1,2,3,4])
    assert_equal "!amanap ,lanac a ,nalp a ,nam A", reverse1("A man, a plan, a canal, panama!") 
  end
  def test_reverse2
   assert_equal [4,3,2,1], reverse2([1,2,3,4])
   assert_equal "!amanap ,lanac a ,nalp a ,nam A", reverse2("A man, a plan, a canal, panama!") 
  end
  def test_reverse3
   assert_equal [4,3,2,1], reverse3([1,2,3,4])
   assert_equal "!amanap ,lanac a ,nalp a ,nam A", reverse3("A man, a plan, a canal, panama!") 
  end
  def test_reverse4
   assert_equal [4,3,2,1], reverse4([1,2,3,4])
   assert_equal "!amanap ,lanac a ,nalp a ,nam A", reverse4("A man, a plan, a canal, panama!") 
  end
end