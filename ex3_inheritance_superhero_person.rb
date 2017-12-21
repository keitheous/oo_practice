class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "#{@name} is #{@age} years old."
  end
end

class SuperHero < Person # BaseClass < SubClass
  def initialize(name, age, superpower)
    super(name, age)
    @superpower = superpower
  end

  def to_s
    "#{@name} is #{@age} years old, with super hero power #{@superpower}."
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

# emily.to_s
#  => "Emily is 28 years old."
# jean_grey.to_s
#  => "Jean Grey is 51 years old, with super hero power Telekinesis."
