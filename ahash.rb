class Ahash
  Error = Class.new(StandardError)

  def initialize(array)
    @array = array
  end

  def [](key)
    index = self.keys.index(key)
    value = @array[index][1] if index
  end

  def []=(key, value)
    index = self.keys.index(key)
    @array[index][1] = value
  end

  def keys
    @array.transpose[0]
  end

  def values
    @array.transpose[1]
  end

  def each
    i=0
    loop do
      yield @array[i]
      i += 1
      break if i == @array.size
    end
  end

  def delete(key)
    index = self.keys.index(key)
    @array.delete_at(indexa[]) if index
  end
end
