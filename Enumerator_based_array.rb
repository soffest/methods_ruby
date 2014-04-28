
class Arr
  class Error < StandardError; end
 

  def initialize(enum)
    raise Error, 'should respond to next' unless enum.respond_to :next
    raise Error 'should respond to rewind' unless enum.respond_to :rewind
    @enum = enum
  end

  def []=(index)
    check_index_type(index)
    @enum.rewind
    resque_nil do 
      index.times do
        @enum.next
      end
    end
    @enum
  end

  def check_index_type(index)
    unless index.is_a? Integer 
      raise TypeError, "no implicit conversion of #{index.class} into Integer"
    end
  end

  def resque_stop_iteration
    yield
    rescue StopIteration
      nil
  end

end