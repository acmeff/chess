require_relative 'piece'
require_relative 'display'
require_relative 'null_piece'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'

require 'byebug'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    # place_pieces

  end

  def place_pieces

    @grid[1].map!.with_index do |square, i|
       Pawn.new(:white, :piece, self, [1, i])
    end
    @grid[6].map!.with_index do |square, i|
       Pawn.new(:black, :piece, self, [6, i])
    end

    self[[0,3]] = Queen.new(:white, :piece, self, [0,3])
    self[[7,3]] = Queen.new(:black, :piece, self, [7,3])

    self[[0,0]] = Rook.new(:white, :piece, self, [0,0])
    self[[0,7]] = Rook.new(:white, :piece, self, [0,7])
    self[[7,0]] = Rook.new(:black, :piece, self, [7,0])
    self[[7,7]] = Rook.new(:black, :piece, self, [7,7])

    self[[0,2]] = Bishop.new(:white, :piece, self, [0,2])
    self[[0,5]] = Bishop.new(:white, :piece, self, [0,5])
    self[[7,2]] = Bishop.new(:black, :piece, self, [7,2])
    self[[7,5]] = Bishop.new(:black, :piece, self, [7,5])

    self[[0,4]] = King.new(:white, :piece, self, [0,4])
    self[[7,4]] = King.new(:black, :piece, self, [7,4])

    self[[0,1]] = Knight.new(:white, :piece, self, [0,1])
    self[[0,6]] = Knight.new(:white, :piece, self, [0,6])
    self[[7,1]] = Knight.new(:black, :piece, self, [7,1])
    self[[7,6]] = Knight.new(:black, :piece, self, [7,6])

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
      elsif self[end_pos].is_a?(NullPiece) || self[start_pos].color != self[end_pos].color
        self[start_pos].position = end_pos
        self[end_pos] = self[start_pos]

        self[start_pos] = NullPiece.instance
      end



    end

  end

  def valid_pos?(pos)
    pos.is_a?(Array) && pos.all?{|el| el.between?(0,7)}
  end

  def  in_check?(color)

    king = grid.flatten.select{|piece| piece.is_a?(King) && piece.color == color}
    king_pos = king[0].position

    grid.flatten.each do |piece|
      unless piece.color == color || piece.is_a?(NullPiece)
        moves = piece.moves
          # debugger
        return true if moves.include?(king_pos)

      end

    end

    false
  end

  def dup
    new_board = Board.new
    grid.flatten.each do |piece|
      unless piece.is_a?(NullPiece)
        piece_copy = piece.class.new(piece.color, piece.symbol, piece.board, piece.position)
        new_board.place_a_piece(piece_copy)
      end

    end

    new_board
  end

  def place_a_piece(piece)
    self[piece.position] = piece
  end

  def checkmate?(color)

    # @grid.flatten.each do |piece|
    #   if piece.color == color
    #
    #     return false unless piece.moves.empty?
    #   end
    # end
    # return true
  end
end



# display.move_cursor
