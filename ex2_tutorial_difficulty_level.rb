# Exercise 2 : Tutorial difficulty levels

class Tutorial
  LEVELS = [:easy, :medium, :hard, :advanced, :expert]
  attr_reader :name, :type, :difficulty

  def initialize(name, type, difficulty)
    @name = name
    @type = type
    @difficulty = difficulty
  end

  def is_harder_than?(compared_to_instance)
    if self.type != compared_to_instance.type
      cannot_compare(self.type, compared_to_instance.type)
    else
      difficulties_in_harder_than_order(self.difficulty, compared_to_instance.difficulty)
    end
  end

  private

  def cannot_compare(first_type, second_type)
    p "You cannot compare a #{first_type.to_s.capitalize} with a #{second_type.to_s.capitalize} tutorial"
  end

  def difficulties_in_harder_than_order(first_level, second_level)
    (LEVELS.index(first_level) > LEVELS.index(second_level)).to_s
  end
end





# execution script from instructions

tutorial1 = Tutorial.new("Object Oriented Ruby", :ruby, :medium)
tutorial2 = Tutorial.new("Introduction to JavaScript", :javascript, :easy)
tutorial3 = Tutorial.new("HTTP Requests, AJAX and APIs", :javascript, :medium)

p 'tutorial1 is defined as : ' + tutorial1.to_s
p 'tutorial2 is defined as : ' + tutorial2.to_s
p 'tutorial3 is defined as : ' + tutorial3.to_s

p 'tutorial1.is_harder_than?(tutorial2)'
p '# ' + tutorial1.is_harder_than?(tutorial2)

p 'tutorial2.is_harder_than?(tutorial1)'
p '# ' + tutorial2.is_harder_than?(tutorial1)

p 'tutorial2.is_harder_than?(tutorial3)'
p '# ' + tutorial2.is_harder_than?(tutorial3)

p 'tutorial3.is_harder_than?(tutorial2)'
p '# ' + tutorial3.is_harder_than?(tutorial2)
