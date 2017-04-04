require_relative 'piece'
require_relative 'display'
require_relative 'null_piece'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new(nil,nil,nil,nil) } }
    @grid.each_with_index do |row, i|
      if [0, 1].include?(i)
        row.map! { |square| Piece.new(:white, :queen, self, [row, i]) }
      elsif [6, 7].include?(i)
        row.map! { |square| Piece.new(:black, :queen, self, [row, i]) }
      end
    end
    self[[2,4]] = Queen.new(:white, :queen, self, [2,4])
    self[[2,3]] = Rook.new(:white, :queen, self, [2,3])
    self[[2,5]] = Bishop.new(:black, :queen, self, [2,5])
  end



  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    if valid_pos?(start_pos) && valid_pos?(end_pos)
      if self[start_pos].is_a?(NullPiece)
        raise "No piece in this start position"
      elsif self[end_pos].is_a?(NullPiece)
        self[start_pos] = NullPiece.new
        self[end_pos] = Piece.new
      end


      #TODO: check end_pos to see if it is a valid place to move
    end

  end

  def valid_pos?(pos)
    pos.is_a?(Array) && pos.all?{|el| el.between?(0,7)}
  end
end

board = Board.new
display = Display.new(board)
display.render
# display.move_cursor
puts "------Queen-----"
p board[[2, 4]].moves
puts "------Rook-----"
p board[[2, 3]].moves
puts "------Bishop-----"
p board[[2, 5]].moves
