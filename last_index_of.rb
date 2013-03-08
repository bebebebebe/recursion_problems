require 'minitest/autorun'

# return sum of a list
def sum array
	if array == []
		0
	else array.shift + sum(array)
	end
end

# return last index of a given input in a list
def last_index_of(n, array)
	if array == []
		-1
	else 
		if array.pop == n			
			1 + last_index_of(array.last, array)
		else last_index_of(n, array)
		end
	end
end

class TestingLastIndex < MiniTest::Unit::TestCase

	def test_not_there
		last_5_is_at([1,2,4], -1)
	end

	def test_empty_array
		last_5_is_at([], -1)			
	end

	def test_simgleton
		last_5_is_at([5], 0)
	end

	def test_at_end
		last_5_is_at([1,2,3,5,5], 4)
	end

	def test_at_start
		last_5_is_at([5, 6, 7], 0)
	end

	def test_midway
		last_5_is_at([5,2,5,6,7,8], 2)
	end

	def last_5_is_at(array, answer)
		assert_equal(last_index_of(5, array), answer)
	end
		
end
