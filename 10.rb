=begin
10 Problem 10
(*) Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

Example:

* (encode '(a a a a b c c a a d e e e e))
((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))
Example in Haskell:

encode "aaaabccaadeeee"
[(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
Solutions


=end

def pack arr
  r = [[]]
  arr.each do |x|
    if r.last.include? x 
       # 不能处理 nil [nil,nil,1,2]
       r.last << x
    else
       r << [x]
    end
  end
  r.delete_if { |i| i == []}
end

def run_length arr
  (pack arr).map { |i| [i.size, i[0]]}
end

require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_run_length
    assert_equal [[4,1], [1,2], [2, 3], [2, 1], [1,4], [4,5]], run_length([1,1,1,1,2,3,3,1,1,4,5,5,5,5])
  end
end
