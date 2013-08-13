
def last_alias x
  x.last
end

def my_last list
	*init, last = list
	if init.empty?
		last
	else
		list.shift
		my_last list 
	end
end

require 'test/unit'
class TestMyLast < Test::Unit::TestCase
  def test_my_last
    assert_equal 1, my_last([1])
    assert_equal 2, my_last([1,2])
    assert_equal 5, my_last([1,3,4,5])
  end
  def test_last_alias
    assert_equal 1, last_alias([1])
    assert_equal 2, last_alias([1,2])
    assert_equal 5, last_alias([1,3,4,5])
  end
end