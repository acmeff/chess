class Piece
  attr_reader :color, :symbol, :position, :board
  def initialize(color, symbol, board, position)
    @color, @symbol, @board, @position = color, symbol, board, position
  end

  def moves
    nil
  end

  def render
    "[P]"
  end
end
