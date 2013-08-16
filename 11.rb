=begin
1 Problem 11 
(*) Modified run-length encoding.

Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

Example:

* (encode-modified '(a a a a b c c a a d e e e e))
((4 A) B (2 C) (2 A) D (4 E))
Example in Haskell:

P11> encodeModified "aaaabccaadeeee"
[Multiple 4 'a',Single 'b',Multiple 2 'c',
 Multiple 2 'a',Single 'd',Multiple 4 'e']
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

def encode_modified arr
  (run_length arr).map { |(counts, item)| 
    if counts == 1
      item
    else
      [counts, item]
    end}
end

require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_run_length
    assert_equal [[4,1], 2, [2, 3], [2, 1], 4, [4,5]], encode_modified([1,1,1,1,2,3,3,1,1,4,5,5,5,5])
  end
end
