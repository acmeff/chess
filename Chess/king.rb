require_relative "piece"
require_relative "stepping_piece"


class King < Piece
  include SteppingPiece
  def move_dirs
    [[1, 1], [1, -1], [-1, 1], [-1, -1], [0, 1], [0, - 1], [-1, 0], [1, 0]]
  end

  def render
    if color == :white
      "[\u2654]"
    else
      "[\u265A]"
    end
  end
end
