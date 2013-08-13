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

def my_length_recur coll
  if coll.empty?
    0
  else
    1 + my_length_recur(rest coll)
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
end