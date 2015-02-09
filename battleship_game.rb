require './player'
require './battleship'
require './board'
require './ships'

#New Game
puts "Please enter name for player 1:"
player1 =gets.chomp
p1 = Player.new player1

puts "Please enter name for player 2:"
player2 = gets.chomp
p2 = Player.new player2

g = Battleship.new(p1, p2) #Player.new "name"


players = [p1,p2]

players.each do |player| 
  puts "#{player.name}, place your ships."
  player.ships_remaining.each_pair do |ship, length|
    puts "Ship: #{ship}"
    spaces_open = false
    until spaces_open == true
      puts "Choose starting coordinates, example: A1"
      start = gets.chomp.upcase
      puts "Place ship horizontally or vertically: h/v"
      direction = gets.chomp.downcase
      spaces_open = player.validate_ship_placement(ship, start, direction)
      if spaces_open == false
        puts "Ship will not fit there. Please try again."
      end
    end
    player.place_ship(ship, start, direction)
  end
  player.display_board
  puts "Press enter to clear for next player."
  gets.chomp
  system "clear"
end
current_player = p1
next_player = p2
until g.won?
  puts
  puts "#{current_player.name}'s Guesses Board"
  next_player.display_guesses_board
  puts "#{current_player.name}, enter guess (ex: 'A1')"
  guess = gets.chomp.upcase
    result = current_player.take_guess(guess, next_player) #returns :h or :m
    if result == :m
      puts "You missed!"
    else
      puts "You got a hit!"
    end
    puts
    next_player.mark_boards(guess, result)
    holding_player = current_player
    current_player = next_player # current_player = p2
    next_player = holding_player
    puts "Press enter to clear for next player."
    gets.chomp
    system "clear"
  end
  puts "#{g.winner} wins!!"
#TODO: until someone wins, take turns
  #Turn:





