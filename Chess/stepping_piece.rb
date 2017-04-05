module SteppingPiece
  def moves
    possible_dirs = move_dirs
    moves = []
    x, y = position
    possible_dirs.each do |dir|
      new_x = x + dir[0]
      new_y = y + dir[1]
      if board.valid_pos?([new_x, new_y])
        target = board[[new_x, new_y]]
        if target.is_a?(NullPiece) || target.color != color
          moves << [new_x, new_y]
        end
      end

    end


    valid_moves(moves)
  end



end
