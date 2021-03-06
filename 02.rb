=begin
2 Problem 2
(*) Find the last but one element of a list.

(Note that the Lisp transcription of this problem is incorrect.)

Example in Haskell:

Prelude> myButLast [1,2,3,4]
3
Prelude> myButLast ['a'..'z']
'y'
=end
def bulit_in_but_last x
  x[-2]
end
# 好方法
def butlast x
  *_, i, _ = x
  i
end
def my_but_last x
  x.pop
  x.pop
end
def new_but_last x
  x.pop
  #x.last
  x[-1]
end
require 'test/unit'
class TestTry < Test::Unit::TestCase
  def test_butlast
    assert_equal 1, butlast([1,2])
    assert_equal 2, butlast([1,2,3])
    assert_equal 4, butlast([1,3,4,5])
  end
  def test_my_but_last
    assert_equal 1, my_but_last([1,2])
    assert_equal 2, my_but_last([1,2,3])
    assert_equal 4, my_but_last([1,3,4,5])
  end
end