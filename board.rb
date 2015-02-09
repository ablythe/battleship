class Board
  def initialize
    @board = [["x",1,2,3,4,5,6,7,8,9,10],["A",0,0,0,0,0,0,0,0,0,0],["B",0,0,0,0,0,0,0,0,0,0],["C",0,0,0,0,0,0,0,0,0,0],["D",0,0,0,0,0,0,0,0,0,0],["E",0,0,0,0,0,0,0,0,0,0],["F",0,0,0,0,0,0,0,0,0,0],["G",0,0,0,0,0,0,0,0,0,0],["H",0,0,0,0,0,0,0,0,0,0],["I",0,0,0,0,0,0,0,0,0,0],["J",0,0,0,0,0,0,0,0,0,0]]
  end

  def board
    @board
  end

  def display_board
    @board.each do |row|
      row.each do |space|
        print " #{space} "
      end
      print "\n"
    end
  end
end