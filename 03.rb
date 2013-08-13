=begin
3 Problem 3
(*) Find the K'th element of a list. The first element in the list is number 1.

Example:

* (element-at '(a b c d e) 3)
c
Example in Haskell:

Prelude> elementAt [1,2,3] 2
2
Prelude> elementAt "haskell" 5
'e'
=end

def rest coll
  coll[1..-1]
end

def element_at enum, number
  enum[number-1]
end

def element_at_recur enum, number
  # 注意：题目中的index是从1开始的
  if number == 1
    enum[0]
    # string没有 first方法因此不能用enum.first
  else
    element_at_recur (rest enum), (number - 1)
  end
end


require 'test/unit'
class TestMyLast < Test::Unit::TestCase
  def test_element_at
    assert_equal 2, element_at([1,2,3], 2)
    assert_equal 'e', element_at("haskell", 5) 
  end
  def test_element_at_recur
    assert_equal 2, element_at_recur([1,2,3], 2)
    assert_equal 'e', element_at_recur("haskell", 5) 

  end
end