
# 
# Class Animal is a parent class for all
# classes that represent each animal
# 
# @author [soffest]
# 
class Animal

  # 
  # Due to callback invoked whenever a subclass
  # is created class animal dynamically defines class method
  # for each subclass depending on it`s index number @n
  # @param  sub [class] subclass
  # 
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

  # 
  # Returns total number of subclasses
  # 
  def self.has_children
    puts "class #{self} has #{@n} children"
  end
end

# 
# Some subclasses for class Animal
# 
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