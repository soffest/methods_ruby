


# 
# Ahash - collection of pairs "key" - "value"
# Based on imbedded class Array
# @author [soffest]
# 
class Ahash
  
  Error = Class.new(StandardError)

  def initialize(array = [])
    @array = array
  end

  # 
  # Gives access to a value by it`s key
  # Returns nil if no such key
  # @param  key [string] 
  # 
  # @return [integer or string] value
  def [](key)
    index = self.keys.index(key) unless @array.empty?
    value = @array[index][1] if index
  end

  # 
  # Changes value in existing pair "key" - "value"
  # or creates new pair with given "key" and "value"
  # @param  key [string] key
  # @param  value [type] value
  # 
  def []=(key, value)
    index = self.keys.index(key) unless @array.empty?
    if index
      @array[index][1] = value
    else
      @array[@array.size] = [key,value]
    end
  end


  # 
  # Selects all keys
  # Returns array of keys
  # @return [array] keys
  def keys
    @array.transpose[0]
  end

  # 
  # Selects all values
  # Returns array of values
  # @return [array] values
  def values
    @array.transpose[1]
  end


  # 
  # Calls the given block once for each element of ahash
  # 
  def each
    unless @array.empty?
      @array.size.times do |i|
        yield @array[i]
      end
    end
  end

  # 
  # Deletes pair "key" - "value" with given key
  # @param  key [string] key
  # 
  def delete(key)
    index = self.keys.index(key) unless @array.empty?
    @array.delete_at(index) if index
  end
end
