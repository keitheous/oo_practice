class Player
  attr_reader :location

  def initialize(location)
    @location = location
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
end

# instructions for task 1

# location = {
#   description: "You are in the living-room. A wizard is snoring loudly on the couch.",
#   items: ["whiskey", "bucket"]
# }
#
# player = Player.new(location)
# player.look_around
# player.pick_up("whiskey")
# player.look_around

class Map
  attr_reader :current_location, :locations
  def initialize(locations)
    @locations = locations
    @current_location = locations.first
  end

  def describe
    location = locations.detect do |location|
      location[:name] = self.current_location
    end

    p location[:description] if location
  end

  def move_to(direction)
    new_location = locations.each do |location|
      edge = location[:edges].first
      edge[:location] if edge[:direction] == direction
    end

    @current_location = new_location
  end
end

locations = [{
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
