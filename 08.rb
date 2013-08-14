=begin
8 Problem 8
(**) Eliminate consecutive duplicates of list elements.

If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

Example:

* (compress '(a a a a b c c a a d e e e e))
(A B C A D E)
Example in Haskell:

> compress "aaaabccaadeeee"
"abcade"
=end

def compress_do arr
  r = []
  if arr.empty? # 没有这个的话 compress_do [] 结果会是 [[]]
    []
  else
    arr.each do |x|
      r << x if r.last != x # 竟然这么简单
    end
  end
  r
end
def compress seq
  if seq.is_a? Array
    compress_do seq
  elsif seq.is_a? String
    (compress_do seq.split(//)).join
  end
end

require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_compress
    assert_equal %w(a b c a d e), compress(%w(a a a a b c c a a d e e e e))
    assert_equal "abcade", compress("aaaabccaadeeee")
  end
end

# 下面这个不对，因为hash的keys不能重复
# 因此无法面对 [1,1,2,1,1]
# 后面的两个1会小时掉
=begin
def compress_do seq
  # 让我们偷懒
  # 利用ruby 2.0 时候 Hash 是保留按插入顺序的
  seq.reduce({}) { |h, i| h[i] = nil; h}.keys 
end
=end