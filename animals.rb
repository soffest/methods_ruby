class Animal

  def self.inherited(sub)
    @n = @n ? @n+1 : 1
    m_name = if @n % 2 > 0
      :walk
    else 
      :fly
    end
    sub.class_eval {
      define_singleton_method(m_name) do
        puts "yes, I can"
      end
    }
  end

  def self.has_children
    puts "class #{self} has #{@n} children"
  end
end

class Bear < Animal
  
  def eat(food)
    ans = true if food == 'mead'
  end
end

class Duck < Animal

  def swim
    puts "#{self} can swim"
  end
end

class Dog < Animal

  def bark
    puts "Bowow"
  end
end

class Crow < Animal

  def quark
    puts "kaaaarrr!!"
  end
end