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

# 那个对于字符串的我没有做
# 因为觉得和ruby不是太有关系
# 特别是 haskell 的list必须是同类型的，因此才有这个需要
# 要用ruby实现需要去判断所有元素都是string然后再做相应处理，意义不大
require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_pack
    assert_equal [[1,1,1,1], [2], [3, 3], [1, 1], [4], [5,5,5,5]], pack([1,1,1,1,2,3,3,1,1,4,5,5,5,5])
  end
end
