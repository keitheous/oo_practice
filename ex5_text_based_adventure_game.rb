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




# instructions

location = {
  description: "You are in the living-room. A wizard is snoring loudly on the couch.",
  items: ["whiskey", "bucket"]
}

player = Player.new(location)
player.look_around
player.pick_up("whiskey")
player.look_around
