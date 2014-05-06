
# 
# 
# Arr - integer-indexed collections (as array)
# Based on imbedded class Enumerator 
# @author [soffest]
# 
class Arr
  Error = Class.new(StandardError)
  
  def initialize(enum)
    raise Error, 'should respond to next' unless enum.respond_to? :next
    raise Error 'should respond to rewind' unless enum.respond_to? :rewind
    @enum = enum
  end

  # 
  # Returns the element at index or nil if index out of range
  # @param  index [integer] index number
  # Indexing starts at 0
  # 
  def [](index)
    check_index_type(index)
    @enum.rewind
    rescue_stop_iteration do 
      (index).times do
        @enum.next
      end
      @enum.peek
    end
  end

  # 
  # Calls the given block once for each element
  # 
  def each
    @enum.rewind
    loop do
      yield @enum.next
      break unless @enum.peek
    end
  end

  # 
  # Returns size of array
  # 
  # @return [integer] returns 0 for empty array
  def size
    i = 0
    loop do
      if self[i]
        i += 1
      else
        break
      end
    end
    i
  end

  # 
  # Searches index of an element with value == elem
  # 
  def search(elem)
    @enum.rewind
    i = 0
    index = nil
    loop do
      index = i if self[i] == elem
      break if ((i == (self.size-1) ) || index)
      i += 1
    end
    index
  end

  # 
  # Raises error if type of index differs from integer
  # @param  index [type] [description]
  # 
  # @return [type] [description]
  def check_index_type(index)
    unless index.is_a? Integer 
      raise TypeError, "no implicit conversion of #{index.class} into Integer"
    end
  end


  # 
  # Stops iteration if it reached last element of enumerator
  # 
  def rescue_stop_iteration
    yield
    rescue StopIteration 
      nil
  end
end
