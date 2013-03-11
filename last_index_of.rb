require 'minitest/autorun'

# returns sum of a list. doesn't mutate array
def sum array
  if array == []
    0
  else array.first + sum(array.drop(1))
  end
end

# return last index of a given input in a list.
def last_index_of(n, array)
  if array == []
    -1
  elsif array == [n]
    0
  elsif last_index_of(n, array.drop(1)) == -1
    array.first == n ? 0 : -1
  else 1 + last_index_of(n, array.drop(1))
  end
end



# *********** VARIARIONS

#return sum of a list. mutates array
def sum! array
  if array == []
    0
  else array.shift + sum!(array)
  end
end


# return last index of a given input in a list. mutates array
def last_index_of!(n, array)
  if array == []
    -1
  else 
    if array.pop == n     
      1 + last_index_of!(array.last, array)
    else last_index_of!(n, array)
    end
  end
end

# doesn't mutate array, but mutates copy of array
def var_last_index_of(n, array)
  array_copy = array.dup
  if array_copy == []
    -1
  else 
    if array_copy.pop == n     
      1 + var_last_index_of(array_copy.last, array_copy)
    else var_last_index_of(n, array_copy)
    end
  end
end

# no mutation, but uses indices.
def ind_last_index_of(n,array)
  if array == []
    -1
  elsif array.last == n
      1 + ind_last_index_of(array[-2], array[0..-2])
    else ind_last_index_of(n, array[0..-2])
  end
end


# *********** TESTS

class TestingLastIndex < MiniTest::Unit::TestCase

  last_5_is_at = Proc.new do |array, answer, situation|
    define_method("test_#{situation}") do
      assert_equal(last_index_of(5, array), answer)
    end
  end 

  last_5_is_at.call([1,2,4], -1, "not_there")
  last_5_is_at.call([], -1, "empty_array")
  last_5_is_at.call([5], 0, "singleton")
  last_5_is_at.call([1,2,3,5,5], 4, "at_end")
  last_5_is_at.call([5,6,7], 0, "at_start")
  last_5_is_at.call([5,2,5,6,7,8], 2, "midway")
  
# I intend     last_5_is_at.call([1,2,4], -1, "not_there")    , above,  to do the same as the following:
  # def test_not_there
  #   assert_equal(last_index_of(5, [1,2,4]), -1)
  #   last_5_is_at([1,2,4], -1)
  # end



  def test_retain_array
    array = [1,2,5]
    last_index_of(5, array)
    assert_equal(array, [1,2,5])
  end
    
end
