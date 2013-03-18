# "Implement reduce; then implement map and filter in terms of reduce."


class Array

  def my_reduce(start, &block)
    if empty?
      start
    else drop(1).my_reduce(yield(start, first), &block)
    end
  end

  def my_map
    my_reduce([]) { |x, y| x << yield(y) }
  end

  def my_filter
    my_reduce([]) { |x, y| yield(y) ? x << y : x }
  end

end