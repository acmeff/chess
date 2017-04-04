require_relative "piece"
require_relative "sliding_piece"

class Queen < Piece
  include SlidingPiece

  def render
    if color == :white
      "[\u2655]"
    else
      "[\u265B]"
    end
  end
  def  move_dirs
    [:upper_left, :upper_right, :lower_left, :lower_right, :right, :left, :up, :down] #Index 0 is diagonal. Index 1 right left
  end
end
