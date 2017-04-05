class Piece
  attr_reader :color, :symbol, :board
  attr_accessor :position
  def initialize(color, symbol, board, position)
    @color, @symbol, @board, @position = color, symbol, board, position

  end

  def moves
    nil
  end

  def render
    "[P]"
  end

  def move_into_check?(end_pos)
    board_copy = board.dup
    board_copy.move_piece(position, end_pos)
    board_copy.in_check?(color)
  end

  def valid_moves(moves)
    moves.reject{|move| move_into_check?(move)}

  end
end
