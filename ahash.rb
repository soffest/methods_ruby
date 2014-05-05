class Ahash
  Error = Class.new(StandardError)

  def initialize(array = [])
    @array = array
  end

  def [](key)
    index = self.keys.index(key) unless @array.empty?
    value = @array[index][1] if index
  end

  def []=(key, value)
    index = self.keys.index(key) unless @array.empty?
    if index
      @array[index][1] = value
    else
      @array[@array.size] = [key,value]
    end
  end

  def keys
    @array.transpose[0]
  end

  def values
    @array.transpose[1]
  end

  def each
    unless @array.empty?
      @array.size.times do |i|
        yield @array[i]
      end
    end
  end

  def delete(key)
    index = self.keys.index(key) unless @array.empty?
    @array.delete_at(index) if index
  end
end
