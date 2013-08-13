=begin
6 Problem 6
(*) Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x).

Example in Haskell:

*Main> isPalindrome [1,2,3]
False
*Main> isPalindrome "madamimadam"
True
*Main> isPalindrome [1,2,4,8,16,8,4,2,1]
True
Solutions
=end

def palindrome coll
  coll == coll.reverse
end

def palindrome2 coll
  size = coll.size
  (0..size).each do |i|
    unless coll[i] == coll[-(i+1)]
      return false
    end
  end
  true
end

require 'test/unit'
class TestMy < Test::Unit::TestCase
  def test_panlindrom
    assert_equal true, palindrome("madamimadam")
    assert_equal false, palindrome([1,2,3])
    assert_equal true, palindrome([1,2,4,8,16,8,4,2,1])
  end
  def test_palindrome2
    assert_equal true, palindrome2("madamimadam")
    assert_equal false, palindrome2([1,2,3])
    assert_equal true, palindrome2([1,2,4,8,16,8,4,2,1])
  end
end