class Arr
  Error = Class.new(StandardError)
  
  def initialize(enum)
    raise Error, 'should respond to next' unless enum.respond_to? :next
    raise Error 'should respond to rewind' unless enum.respond_to? :rewind
    @enum = enum
  end

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

  def each
    @enum.rewind
    loop do
      yield @enum.next
      break unless @enum.peek
    end
  end

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

  def search (elem)
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

  def check_index_type(index)
    unless index.is_a? Integer 
      raise TypeError, "no implicit conversion of #{index.class} into Integer"
    end
  end

  def rescue_stop_iteration
    yield
    rescue StopIteration 
      nil
  end
end
