class MyArray < Array


  def my_size 
    i =0
    arr = self
    while arr[i]
      i+=1
    end
    return i
  end

  def my_each
    i =0
    arr = self
    while i< arr.mySize do
      yield arr[i]
      i+=1
  end
end


class MyHash < Hash
  def has_key?(key)
    k = self.keys
    i = 0
    answer =false
    while ( i < k.size ) && ( !answer )
      answer = true if (k[i]==key)
      i += 1
    end
    answer
  end

  def my_map 
    k = self.keys
    i = 0
    while k[i] do
      yield [k[i], self[k[i]] ]
      i+=1
    end
  end
end



p = MyArray.new
p[0..5] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
l = p.my_size
puts "size = #{l}"
p.my_each { |el| puts "1/element = #{el = 1/el}" }


h = MyHash.new
h['a'] = 1
h['b'] = 2
h['c'] = 3
puts "found key: #{h.has_key?('c')}"
puts "found key: #{h.has_key?('m')}"

h.my_map{ |key, value| puts "key : #{key}, value: #{value} value+1: #{value +=1}" }


end