=begin
7 Problem 7
(**) Flatten a nested list structure.

Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

Example:

* (my-flatten '(a (b (c d) e)))
(A B C D E)
=end
def rest coll
  coll[1..-1]
end
def my_flatten coll
  coll.flatten
end
def my_flatten_recur coll
  if coll.empty?
    []
  elsif
    coll.first.is_a? Array
    my_flatten_recur(coll.first) + my_flatten_recur(rest coll)
  else
    [coll.first] + my_flatten_recur(rest coll)
  end
end
require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_my_flatten
    assert_equal [1,2,3,4,5], my_flatten([1, [2, [3, 4], 5]])
    assert_equal [], my_flatten([])
  end
  def test_my_flatten_recur
    assert_equal [1,2,3,4,5], my_flatten_recur([1, [2, [3, 4], 5]])
    assert_equal [], my_flatten_recur([])
  end
 
end