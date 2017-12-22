class Player
  attr_reader :location, :map

  def initialize(input_location = nil)
    @map = Map.new(Map::DEFAULT_LOCATIONS)

    @location = map.current_location
  end

  def look_around
    p "Location: #{self.location[:description]}"
    self.location[:items].each do |item|
      p "You see a #{item} on the floor"
    end

    nil
  end

  def pick_up(item)
    current_items = self.location[:items]
    current_items.delete_at(rand(current_items.length))
    current_items << item

    "picked up #{item}"
  end

  # def walk()
  # end
end


class Map
  attr_reader :current_location, :locations
  DEFAULT_LOCATIONS =[{
    name: "living_room",
    description: "You are in the living-room. A wizard is snoring loudly on the couch.",
    items: ["whiskey", "bucket"],
    edges: [{
      direction: "upstairs",
        item: "ladder",
        location: "attic"
    }]
  },
  {
    name: "attic",
    description: "You are in the attic. There is a giant welding torch in the corner.",
    edges: [{
      direction: "downstairs",
      item: "ladder",
      location: "living_room"
    }]
  }]

  def initialize(input_locations)
    @locations = input_locations
    @current_location = locations.first
  end

  def describe
    p "Description for current location:"
    p self.current_location[:description]

    p '======================================'
    all_paths = locations.collect{|location| location[:name]}
    all_paths.delete(current_location[:name])
    p "Available Paths : #{all_paths.join(', ')}"
    p '======================================'
  end

  def move_to(direction)
    location_instance_with_direction =
      locations.detect do |location|
        location[:edges].first[:direction] == direction
      end

    new_location_name =
      location_instance_with_direction[:edges].first[:location]

    @current_location =
      locations.detect do |location|
        location[:name] == new_location_name
      end

    self.describe
  end
end

map = Map.new(Map::DEFAULT_LOCATIONS)
p 'moving upstairs'
map.move_to("upstairs")
p 'moving dowstairs'
map.move_to("downstairs")
