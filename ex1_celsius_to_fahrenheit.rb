class DailyTemperature
  attr_reader :name, :celsius, :fahrenheit

  def initialize(name, celsius)
    @name = name
    @celsius = celsius
  end

  def formulate_fahrenheit
    @fahrenheit = conversion_formula(celsius)
  end

  private

  def conversion_formula(celsius)
    (celsius * 1.8 + 32).round
  end
end

#monday = Day.new('monday', 6)
#class for the entire 7 days of a week
