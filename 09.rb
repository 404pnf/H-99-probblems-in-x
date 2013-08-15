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

=begin
# 这里有个答案
# http://www.perlmonks.org/?node_id=632023
# Ruby

This was discussed at length on the Ruby-Talk mailing list, with many different solutions offered. My favourite is similar to tye's Perl solution:

s = "ZBBBCZZ"
x = []
s.scan(/((.)\2*)/){x.push [$~[0]]}
=end

=begin
haskell的方法
-- > group "Mississippi" = ["M","i","ss","i","ss","i","pp","i"]
--
-- It is a special case of 'groupBy', which allows the programmer to supply
-- their own equality test.
group                   :: Eq a => [a] -> [[a]]
group                   =  groupBy (==)

-- | The 'groupBy' function is the non-overloaded version of 'group'.
groupBy                 :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy _  []           =  []
groupBy eq (x:xs)       =  (x:ys) : groupBy eq zs
                           where (ys,zs) = span (eq x) xs
=end


=begin
该题提供的solution之一
A simple solution:

pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack [x] = [[x]]
pack (x:xs) = if x `elem` (head (pack xs))
              then (x:(head (pack xs))):(tail (pack xs))
              else [x]:(pack xs)
=end

# 竟然这个开始写的方法是对的
# 且我没有能力实现上面我参考其它答案的写法

def pack arr
  r = [[]]
  arr.each do |x|
    if r.last.include? x 
       r.last << x
    else
       r << [x]
    end
    #p r
  end
  r.drop 1 # 第一个元素是开始我们放入的那个[]，在[[]]中
  #r.delete_if { |i| i == []}
end
# 下面这个应该看看
=begin
# 那个ruby字符串用scan的是对的，但根本明白一丝
# 主要不明白 \2* 哪里来的
2.0.0dev :022 > 'abbc'.scan(/((.))/)
 => [["a", "a"], ["b", "b"], ["b", "b"], ["c", "c"]]
2.0.0dev :023 > 'abbc'.scan(/((.)\2)/)
 => [["bb", "b"]]
2.0.0dev :024 > 'abbc'.scan(/((.)\2*)/)
 => [["a", "a"], ["bb", "b"], ["c", "c"]]
2.0.0dev :025 > 'abbc'.scan(/((.)\2*)/).map {|i, _| i}
 => ["a", "bb", "c"]
2.0.0dev :026 >
=end 

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
