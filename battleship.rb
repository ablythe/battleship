class Battleship
   def initialize player1, player2
    @p1 = player1 #Player.new "name"
    @p2 = player2

  end

  def player1
    @p1
  end

  def player2
    @p2
  end

  def won?
    if @p1.ships_remaining == {}
      @winner =@p2.name
      true
    elsif @p2.ships_remaining =={}
      @winner =@p1.name
      true
    else
      false
    end
  end

  def winner
    @winner
  end

end