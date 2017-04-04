require_relative "piece"
require_relative "sliding_piece"

class Rook < Piece
  include SlidingPiece
  def move_dirs
    [:up, :down, :left, :right]
  end

  def render
    if color == :white
      "[\u2656]"
    else
      "[\u265C]"
    end
  end

end
