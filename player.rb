class Player
  attr_reader :name # def name @name end
  def initialize player_name
    @name = player_name #name"
    @board = Board.new #board with ships
    @guesses_board =Board.new #board with ships hidden
    @ships = Ships.new
  end
  #@ships = Object: Ship, contiaining: @ships_remaining, access to: all ships methods
  def board
    @board.board   
  end

  def guesses_board
    @guesses_board.board
  end

  def display_guesses_board
    @guesses_board.display_board
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
    opponent_position = opponent.board[position[0]][position[1]]
    if opponent_position == :b || opponent_position == :c || opponent_position== :d || opponent_position ==:s || opponent_position==:p 
      marker = :h 
      ship_symbols = {battleship: :b, carrier: :c, destroyer: :d, submarine: :s, patrol_boat: :p}
      opponent.get_hit ship_symbols.key(opponent_position)
    else
      marker = :m 
    end
    marker
  end
  

  def convert_input input #string guess -> [x,y]
    position = [] # [ row, column]
    rows = {"A" => 1,"B" => 2,"C"=> 3,"D"=> 4,"E"=> 5,"F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10 }
    input_array = input.split("",2)  #guess ="A1", ["A", "1"]
    position.push rows[input_array[0]] # A=>1
    position.push input_array[1].to_i # "1" => 1
    return position
  end 
  
  def mark_boards (guess, marker) # position is an array[]
    position = convert_input(guess)
    row = position[0]
    column = position[1]
    board[row][column] = marker
    guesses_board[row][column] = marker
  end
  

  def validate_ship_placement ship, start, direction
    starting_position = convert_input(start)  # start coordinates [4,5]
    row = starting_position[0]  #4
    column = starting_position[1]  #5
    ship_length = ships_remaining[ship]
    spaces_open = true
    if direction == 'h'
      if 11 - (column + ship_length) >= 0 && board[row][column..(column+(ship_length-1))].count(0) ==ship_length
        spaces_open =true
      else 
        spaces_open = false
      end
    else #vertical
      if 11 - (row + ship_length) >= 0
        ship_length.times do
          if board[row][column] != 0
            spaces_open = false
          end
          row += 1
        end  
      else
        spaces_open =false
      end
    end 
    return spaces_open
  end

  def place_ship (ship, start, direction)
    ship_length = @ships.ships_remaining[ship]
    starting_position = convert_input(start)  # start coordinates [4,5]
    row = starting_position[0]  #4
    column = starting_position[1]  #5
    ship_symbols = {battleship: :b, carrier: :c, destroyer: :d, submarine: :s, patrol_boat: :p}
    marker = ship_symbols[ship]
    if direction == "h"  
      ship_length.times do 
        board[row][column] = marker
        column += 1
      end
    else #direction = vertical
      ship_length.times do
        board[row][column] = marker
        row += 1
      end
    end
  end

  def get_hit (ship)
    ships_remaining[ship] -= 1 # @ships.ships_remaining  = @ships.@ships_remaining
    @ships.sink?
  end
end