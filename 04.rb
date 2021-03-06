=begin
4 Problem 4
(*) Find the number of elements of a list.

Example in Haskell:

Prelude> myLength [123, 456, 789]
3
Prelude> myLength "Hello, world!"
13
=end

def rest coll
  coll[1..-1]
end

def my_length coll
  coll.size
end

# 递归喽
def my_length_recur coll
  if coll.empty?
    0
  else
    1 + my_length_recur(rest coll)
  end
end

# 先将所有元素都变成1，然后求和就可以了
# 对字符串无效
def my_length_foldl coll
  if coll.is_a? String
    coll.split(//).map {|i| 1}.reduce(:+)
  else
    coll.map {|i| 1}.reduce(:+)
  end
end

require 'test/unit'
class TestMyLast < Test::Unit::TestCase
  def test_my_length
    assert_equal 3, my_length([123, 456, 789])
    assert_equal 13, my_length("Hello, world!") 
  end
  def test_my_length_recur
    assert_equal 3, my_length_recur([123, 456, 789])
    assert_equal 13, my_length_recur("Hello, world!") 
  end
  def test_my_length_foldl
    assert_equal 3, my_length_foldl([123, 456, 789])
    assert_equal 13, my_length_foldl("Hello, world!") 
  end
end