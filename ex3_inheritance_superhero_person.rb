class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "#{@name} is #{@age} years old."
  end
end

# SuperHero < Person means that Person is the the base class and SuperHero is the subclass
class SuperHero < Person
  def initialize(name, age, superpower)
    super(name, age)
    @superpower = superpower
  end
end

# in irb
# emily = Person.new("Emily", 28)
# jean_grey = SuperHero.new("Jean Grey", 51, "Telekinesis")

# emily.is_a?(Person)
#  => true
# jean_grey.is_a?(Person)
#  => true

# emily.is_a?(SuperHero)
#  => false
# jean_grey.is_a?(SuperHero)
#  => true
