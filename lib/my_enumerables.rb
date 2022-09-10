module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in (0..(self.length - 1))
      yield self[i], i
    end
    self
  end

  def my_select
    result = []
    for i in self
      result << i if yield i
    end
    result
  end

  def my_all?(pat = TrueClass)
    for i in self
      if block_given?
        result = yield i
      elsif pat == TrueClass
        result = ((i&&true) in ^pat)
      else
        result = (i in ^pat)
      end
      result ? next : break
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield i
    end
    self
  end
end
