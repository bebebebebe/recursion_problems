
class Array

  def my_reduce(start, &block)
    if self == []
      start
    else self.drop(1).my_reduce(yield(start, self.first), &block)
    end
  end

  def my_map
    self.my_reduce([]) { |x, y| x << yield(y) }
  end

  def my_filter
    self.my_reduce([]) { |x, y| yield(y) ? x << y : x }
  end

end