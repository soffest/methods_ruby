class MyHash < Hash


  def self.map
    el=h.shift
    yield el
    self.map(h) if h.any?
  end

end