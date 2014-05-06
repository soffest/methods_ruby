require "arr.rb"

# 
# Ahash - collection of pairs "key" - "value"
# Based on arr
# @author [soffest]
# 
class MyHash

  Error = Class.new(StandardError)

  def initialize(keys, values)
    raise TypeError, 'keys should respond to search' unless keys.respond_to? :search
    raise TypeError 'values should respond to search' unless values.respond_to? :search
    @keys = keys
    @values = values
  end

  # Gives access to a value by it`s key
  # Returns nil if no such key
  # @param  key [string] 
  # 
  # @return [integer or string] value
  def [](key)
    index = @keys.search(key)
    value = @values[index] if index
  end

  # 
  # Selects all keys
  # Returns array of keys
  # @return [array] keys
  def keys
    @keys
  end

  # 
  # Calls the given block once for each element of ahash
  # 
  def each
    i=0
    loop do
      yield @keys[i], @values[i]
      i += 1
      break if i == @keys.size
    end
  end
end
