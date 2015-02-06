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

  def take_guess guess 
    @position = [] # [ row, column]
    rows = {"A" => 1,"B" => 2,"C"=> 3,"D"=> 4,"E"=> 5,"F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10 }
    guess_array = guess.split("")  #guess ="A1", ["A", "1"]
    @position.push rows[guess_array[0]] # A=>1
    @position.push guess_array[1].to_i # "1" => 1
    return @position
  end 
end