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
      puts [
        day.upcase,
        temperature_string(temperature.celsius, 'C'),
        temperature_string(temperature.fahrenheit, 'F')
      ].join(' | ')
    end
  end

  private

  def temperature_string(temperature, unit)
    "#{temperature} degrees #{unit}"
  end
end

weekly_reading = WeeklyTemperature.new(16, 17, 18, 18, 21, 16, 19)
weekly_reading.print_temperatures

# to wrap this up, I would create a script to prompt for User to input celsius from
# monday to friday and then feed this to line 45's parameters
