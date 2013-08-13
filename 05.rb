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


# 如果用递归，因为ruby的sting没有pop，且拼出来的结果默认是array
# 因此没有方法写一个通用的
=begin
def reverse2 coll
  if coll.empty?
    []
  else
    [coll[-1]].concat (reverse2 (but_last coll))
  end
end 
=end #错误的，因为结果是array，如果输入是string的话，就不对

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
end