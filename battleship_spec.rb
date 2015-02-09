require 'simplecov'

SimpleCov.start
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
    alex =Player.new "Alex"
    guess = emily.take_guess "A1", alex
    assert_equal guess, :m
    guess_two = emily.take_guess "D6", alex
    assert_equal guess_two, :m
  end

  def test_position_gets_marked_on_board
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    emily.take_guess "A1", alex
    alex.mark_boards "A1", :m 
    assert_equal alex.board[1][1], :m 
  end

  def test_player_can_position_ships
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    emily.place_ship(:destroyer, "D5", "h")
    assert_equal emily.board[4], ["D",0,0,0,0,:d,:d,:d,0,0,0]
    alex.place_ship(:patrol_boat, "C2", "vertical")
    assert_equal alex.board[3][2], :p  
    assert_equal alex.board[4][2], :p 
  end

  def test_player_can_hit_a_ship
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    emily.place_ship(:destroyer, "D5", "h")
    alex.take_guess "D5", emily
    emily.mark_boards "D5", :h
    assert_equal emily.board[4][5], :h
  end

  def test_player_can_sink_ships
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    alex.ships_remaining[:battleship] = 1
    alex.get_hit(:battleship)
    assert_equal alex.ships_remaining[:battleship], nil
    assert_equal alex.ship_count, 4  
  end

  def test_player1_can_win
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    g = Battleship.new alex, emily
    refute g.won?
    alex.ships_remaining.replace({}) 
    assert_equal g.won?, true 
    assert_equal g.winner, "Emily"
  end

  def test_player2_can_win
    alex = Player.new "Alex"
    emily = Player.new "Emily"
    g = Battleship.new alex, emily
    emily.ships_remaining.replace({}) 
    assert_equal g.won?, true 
    assert_equal g.winner, "Alex"
  end

  def test_player_cannot_place_off_the_board
    alex = Player.new "Alex"
    assert_equal false, alex.validate_ship_placement(:battleship, "J1", 'vertical')
    assert_equal false, alex.validate_ship_placement(:battleship, "J10", 'h')
  end

  def test_player_cannot_place_ship_on_another_ship
    alex = Player.new "Alex"
    alex.place_ship(:destroyer, "D5", "h")
    assert_equal false, alex.validate_ship_placement(:battleship, "D5", "h")
    assert_equal false, alex.validate_ship_placement(:battleship, "D5", "v")
  end

end