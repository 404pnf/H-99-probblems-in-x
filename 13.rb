=begin
3 Problem 13
(**) Run-length encoding of a list (direct solution).

Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 9, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.

Example:

* (encode-direct '(a a a a b c c a a d e e e e))
((4 A) B (2 C) (2 A) D (4 E))

=end

def encode_direct arr
  r = [[]]
  arr.each do |x|
    if r.last.include? x 
       r.last << x
    else
       r << [x]
    end
    #p r #debug
  end
  r = r.delete_if { |i| i == []}
  r.map do |e|
    if e.size == 1
      e.first
    else
      e
    end
  end
end
require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_encode_direct
    assert_equal [[1,1,1,1], 2, [3, 3], [1, 1], 4, [5,5,5,5]], encode_direct([1,1,1,1,2,3,3,1,1,4,5,5,5,5])
  end
end
