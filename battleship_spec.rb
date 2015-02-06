require 'minitest/autorun'
require './player'
require './battleship'
require './board'
require './ships'

class BattleshipTest < MiniTest::Test

  def test_game_has_two_players
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    g = Battleship.new alex, emily
    assert_equal g.player1, alex
    assert_equal g.player2, emily
  end

  def test_game_has_board
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    g = Battleship.new alex, emily
    assert_equal alex.board, [["x",1,2,3,4,5,6,7,8,9,10],["A",0,0,0,0,0,0,0,0,0,0],["B",0,0,0,0,0,0,0,0,0,0],["C",0,0,0,0,0,0,0,0,0,0],["D",0,0,0,0,0,0,0,0,0,0],["E",0,0,0,0,0,0,0,0,0,0],["F",0,0,0,0,0,0,0,0,0,0],["G",0,0,0,0,0,0,0,0,0,0],["H",0,0,0,0,0,0,0,0,0,0],["I",0,0,0,0,0,0,0,0,0,0],["J",0,0,0,0,0,0,0,0,0,0]]
  end

  def test_players_have_ships
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    assert_equal alex.ship_count, 5
    assert_equal emily.ship_count, 5
  end

  def test_players_have_multiple_ships
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    assert_equal alex.ships_remaining, { carrier: 5, battleship: 4, destroyer: 3, submarine: 3, patrol_boat: 2}
  end

  def test_player_can_take_guess
    emily = Player.new "Emily"
    guess = emily.take_guess "A1"
    assert_equal guess, [1,1]
    guess_two = emily.take_guess "D6"
    assert_equal guess_two, [4,6]
  end

end