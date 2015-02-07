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


players = [p1,p2]
players.each do |player| 
  puts "#{player.player}, place your ships."
  player.ships_remaining.each_pair do |ship, length|
    puts "Ship: #{ship}"
    puts "Choose starting coordinates, example: A1"
    start = gets.chomp
    puts "Place ship horizontally or vertically?"
    direction = gets.chomp
    player.place_ship(ship, start, direction)
  end
  player.display_board
end


#TODO: until someone wins, take turns
  #Turn:
    #see board of guesses made
    #take a guess 
    #tell player hit or miss
    #mark board 

    #check if someone won game