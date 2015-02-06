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

g = Battleship.new(p1, p2)

p1.board
#Place Ships DONE
puts "Player 1, place your ships."

p1.ships_remaining.each_pair do |ship, length|
  puts "Ship: #{ship}"
  puts "Choose starting coordinates, example: A1"
  start = gets.chomp
  puts "Place ship horizontally or vertically?"
  direction = gets.chomp

  p1.place_ship(ship, start, direction)

end
p1.display_board
#Turn:
  #take a guess DONE
  #tell player hit or miss
  #mark board DONE

  #check if someone won game?