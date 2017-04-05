require_relative "piece"
require_relative "stepping_piece"


class Knight < Piece
  include SteppingPiece
  def move_dirs
    [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, - 1], [-2, 1], [-2, -1]]
  end

  def render
    if color == :white
      "[\u2658]"
    else
      "[\u265E]"
    end
  end
end
