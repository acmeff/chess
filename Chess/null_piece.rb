require_relative "piece"
require 'singleton'
class NullPiece < Piece

  # include Singleton

  def render
    "[ ]"
  end

end
