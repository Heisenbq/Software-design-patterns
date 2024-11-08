require 'minitest/autorun'
require './ArrayHandler.rb'

class Tests < Minitest::Test
  def setup
    @array_handler = ArrayHandler.new([3,1,21,5,12])
  end

  def test_cycle
    result = []
    @array_handler.cycle(2) {|el| result.append(el)}
    expected = [3, 1, 21, 5, 12, 3, 1, 21, 5, 12]
    assert_equal expected,result
  end

  def test_inject
    result = @array_handler.inject {|acc,el| acc + el }
    expected = 42
    assert_equal expected,result
  end
  
  def test_reject
    result = @array_handler.reject {|el| el<10}
    expected = [21,12]
    assert_equal expected,result
  end

  def test_sort_by
    result = @array_handler.sort_by {|el| el}
    expected = [1,3,5,12,21]
    assert_equal expected,result
  end

  def test_max_by
    result = @array_handler.max_by {|el| el}
    expected = [21]
    assert_equal expected,result
  end
  
  def test_each_slice
    result = []
    @array_handler.each_slice(2) {|arr| result.append (arr)}
    expected = [[3,1],[21,5],[12]]
    assert_equal expected,result
  end
end