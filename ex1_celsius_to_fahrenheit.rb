class DailyTemperature
  attr_reader :celsius, :fahrenheit

  def initialize(celsius)
    @celsius = celsius
    @fahrenheit = conversion_formula(celsius)
  end

  private

  def conversion_formula(celsius)
    (celsius * 1.8 + 32).round
  end
end

class WeeklyTemperature
  DAYS = ['mon', 'tues', 'wed', 'thu', 'fri', 'sat', 'sun']
  attr_reader :weekly_reading

  def initialize(*args)
    @weekly_reading = {}

    DAYS.each_with_index do |day, index|
      @weekly_reading[day] = DailyTemperature.new(args[index])
    end
  end

  def print_temperatures
    self.weekly_reading.each do |day, temperature|
      puts '===='
      # puts day.upcase
      # puts temperature.celsius
      puts [day.upcase, temperature.celsius, temperature.fahrenheit].join(' | ')
    end
  end
end

# monday = DailyTemperature.new('monday', 6)
# class for the entire 7 days of a week
# 16, 17, 18, 18, 21, 16, 19

# weekly_reading = WeeklyTemperature.new(16, 17, 18, 18, 21, 16, 19)
# weekly_reading.print_temperatures
