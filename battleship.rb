class Battleship
   def initialize player1, player2
    @p1 = player1
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
      @winner =@p2
      true
    elsif @p2.ships_remaining =={}
      @winner =@p1
      true
    else
      false
    end
  end

  def winner
    @winner
  end

end