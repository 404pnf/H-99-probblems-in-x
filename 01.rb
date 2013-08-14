# 默认的方法
def last_alias x
  #x.last
  x[-1] # 这个写法既可以用在array上也可以用在string上
end

# 好方法
def mylast list
  *_, x = list
  x
end
# 当last返回是nil的时候，你并不知道为什么 ：）
#2.0.0-rc1 :014 > [].last
# => nil
#2.0.0-rc1 :015 > [1,nil].last
# => nil

require 'test/unit'
class TestMyLast < Test::Unit::TestCase
  def test_mylast
    assert_equal 1, mylast([1])
    assert_equal 2, mylast([1,2])
    assert_equal 5, mylast([1,3,4,5])
  end
  def test_last_alias
    assert_equal 1, last_alias([1])
    assert_equal 2, last_alias([1,2])
    assert_equal 5, last_alias([1,3,4,5])
  end
end