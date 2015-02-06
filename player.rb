class Player
  def initialize player
    @player = player
    @board = Board.new
    @ships = Ships.new
  end

  def board
    @board.display_board   
  end

  def ship_count
    @ships.ship_count
  end

  def ships_remaining
    @ships.ships_remaining
  end

  # def take_guess guess 
  #   guess.split("") each do |c|
  #     if c == 
  # end
end