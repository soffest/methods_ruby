require "arr.rb"

class MyHash
  Error = Class.new(StandardError)

  def initialize(keys, values)
    raise TypeError, 'keys should respond to search' unless keys.respond_to? :search
    raise TypeError 'values should respond to search' unless values.respond_to? :search
    @keys = keys
    @values = values
  end

  def [](key)
    index = @keys.search(key)
    value = @values[index] if index
  end

  def keys
    @keys
  end

  def each
    i=0
    loop do
      yield @keys[i], @values[i]
      i += 1
      break if i == @keys.size
    end
  end

  def delete(key)
    index = @keys.search(key)
    if index 
      @keys[index] = nil
      @values[index] = nil
    end
  end
end
