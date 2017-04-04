require_relative "piece"
require_relative "sliding_piece"

class Bishop < Piece
  include SlidingPiece

  def render
    if color == :white
      "[\u2657]"
    else
      "[\u265D]"
    end
  end
  def  move_dirs
    [:upper_left, :upper_right, :lower_left, :lower_right] #Index 0 is diagonal. Index 1 right left
  end
end
