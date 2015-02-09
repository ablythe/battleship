class Ships
  def initialize
    # @ship_count = 5
    @ships_remaining = { carrier: 5, battleship: 4, destroyer: 3, submarine: 3, patrol_boat: 2}
  end

  def ship_count
    # @ship_count
    @ships_remaining.length
  end

  def ships_remaining
    @ships_remaining
  end

  def sink?
    ships_remaining.delete_if {|ship, lives| lives == 0}
  end


end