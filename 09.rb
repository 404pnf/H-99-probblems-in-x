=begin
9 Problem 9
(**) Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.

Example:

* (pack '(a a a a b c c a a d e e e e))
((A A A A) (B) (C C) (A A) (D) (E E E E))
Example in Haskell:

*Main> pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 
             'a', 'd', 'e', 'e', 'e', 'e']
["aaaa","b","cc","aa","d","eeee"]
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

require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_pack
    assert_equal [[1,1,1,1], [2], [3, 3], [1, 1], [4], [5,5,5,5]], pack([1,1,1,1,2,3,3,1,1,4,5,5,5,5])
  end
end
