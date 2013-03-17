# reduce 

# def my__other_reduce(proc, array, start)
#   if array == []
#   	start
#   else proc.call(start, my__other_reduce(proc, array.drop(1), array.first))
#   end
# end

# my_sum = Proc.new { |x, y| x + y }
# answer = my_other_reduce(my_sum, [1,2,3], 0)
# #puts answer

class Array

	def my_reduce(start, &block)
		if self == []
			start
		else block.call(start, self.drop(1).my_reduce(self.first, &block))
		end
	end

end

class Array

	def my_map(&block)
		

	end

end



puts [1,2,3].my_reduce(0) { |x, y| x + y }


# implement map using my_reduce

# array.map { |x| x * 2}