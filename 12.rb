=begin
2 Problem 12
(**) Decode a run-length encoded list.

Given a run-length code list generated as specified in problem 11. Construct its uncompressed version.

Example in Haskell:

P12> decodeModified 
       [Multiple 4 'a',Single 'b',Multiple 2 'c',
        Multiple 2 'a',Single 'd',Multiple 4 'e']
"aaaabccaadeeee"

=end



def decode_modified arr
  arr.map do |e|
    if e.is_a? Array
      count, item = e
      r = []
      count.times {r << item}
      r
    else
      e
    end
  end.flatten
end

require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_decode_modified
    assert_equal [1,1,1,1,2,3,3,1,1,4,5,5,5,5], decode_modified([[4,1], 2, [2, 3], [2, 1], 4, [4,5]])
  end
end
