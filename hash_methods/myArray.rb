class MyArray < Array

  def size 
    i =0
    while a[i]
      yield i+=1
    end
  end

  def each
    i =0
    arr = self
    while i< arr.size do
      yeld arr[i]
    end
end