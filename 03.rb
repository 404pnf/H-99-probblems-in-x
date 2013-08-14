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
  coll[1..-1] # 适用于String和Array
  # coll.drop(1) #只适用于Array
  # _, *x = coll #只适用于Arra
  # x
end

# 和element_at_recur比说不上是更好还是更不好
def get_value_at list, i
  if list.empty?
    nil
  elsif i < 1
    nil
  elsif i == 1
    x, *_ = (list.is_a? String) ? list.split(//) : list #is_a? 有问号，因此需要括起来
    x
  else
    get_value_at (rest list), (i - 1)
  end
end
  

def element_at enum, number
  enum[number-1] # 题目说了第一个元素的编号是1
end

# 假递归，以为还是用了ruby内容的[index]方法
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
    assert_equal nil, element_at([1,2,3], 5)
  end
  def test_get_value_at
    assert_equal 2, get_value_at([1,2,3], 2)
    assert_equal 'e', get_value_at("haskell", 5) 
    assert_equal nil, get_value_at([1,2,3], 5)
  end
  def test_element_at_recur
    assert_equal 2, element_at_recur([1,2,3], 2)
    assert_equal 'e', element_at_recur("haskell", 5) 
  end
end