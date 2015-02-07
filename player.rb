class Player
  attr_reader :player
  def initialize player
    @player = player
    @board = Board.new
    #ADDED BOARD THAT SHOWS WHERE GUESSES HAVE BEEN MADE
    @guesses_board =Board.new 
    @ships = Ships.new
  end
  #@ships = Object: Ship, contiaining: @ships_remaining, access to: all ships methods
  def board
    @board.board   
  end

  def display_board
    @board.display_board
  end

  def ship_count
    @ships.ship_count
  end

  def ships_remaining
    @ships.ships_remaining
  end

  def take_guess guess, opponent #"D5"
    position =convert_input guess #[4,5]
    if opponent.board[position[0]][position[1]] == :s 
      marker = :h 
    else
      marker = :m 
    end
    marker
  end

  def convert_input input
    @position = [] # [ row, column]
    rows = {"A" => 1,"B" => 2,"C"=> 3,"D"=> 4,"E"=> 5,"F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10 }
    input_array = input.split("")  #guess ="A1", ["A", "1"]
    @position.push rows[input_array[0]] # A=>1
    @position.push input_array[1].to_i # "1" => 1
    return @position
  end 
  
  def mark_board (position, marker) # position is an array[]
    row = position[0]
    column = position[1]
    board[row][column] = marker 
    #TODO: MAKE GUESS_BOARD MATCH OWN BOARD BUT WITHOUT SHIPS
  end
  

  def validate_ship_placement ship, start, direction
  #TODO: A)CHECK IF SHIP WILL FIT ON BOARD
      #B) IF SHIP WILL OVERLAP WITH ANOTHER SHIP
  end

  def place_ship (ship, start, direction)
  ship_length = @ships.ships_remaining[ship]
    starting_position = convert_input(start)  # start coordinates [4,5]
    row = starting_position[0]  #4
    column = starting_position[1]  #5
    old_board = board
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

  def get_hit (ship)
    ships_remaining[ship] -= 1 # @ships.ships_remaining  = @ships.@ships_remaining
    @ships.sink?
  end
end