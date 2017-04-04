require "colorize"
require_relative 'cursor'
class Display
  attr_reader :board
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    board.grid.each_with_index do |row, r_index|
      row_string = " "
      row.each_with_index do |piece, c_index|
        if [r_index, c_index] == @cursor.cursor_pos
          row_string << piece.render.green
        else
          row_string << piece.render
        end

      end
      puts row_string
    end
  end

  def move_cursor
    3.times do
      render
      @cursor.get_input
      render
    end
    

  end

end
