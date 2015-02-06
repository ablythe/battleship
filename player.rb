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
    convert_input guess
  end

  def convert_input input
    @position = [] # [ row, column]
    rows = {"A" => 1,"B" => 2,"C"=> 3,"D"=> 4,"E"=> 5,"F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10 }
    input_array = input.split("")  #guess ="A1", ["A", "1"]
    @position.push rows[input_array[0]] # A=>1
    @position.push input_array[1].to_i # "1" => 1
    return @position
  end 

  def mark_board (position) # position is an array[]
    row = position[0]
    column = position[1]
    board[row][column] = :m 
  end

  def place_ship (ship, start, direction)
    ship_length = @ships.ships_remaining[ship]
    starting_position = convert_input(start)  # start coordinates [4,5]
    row = starting_position[0]  #4
    column = starting_position[1]  #5
    if direction == "horizontal"  
      ship_length.times do 
        board[row][column] = :s
        column += 1
      end
    else #direction = vertical
      ship_length.times do
        board[row][column] = :s
        row += 1
      end
    end
  end
end