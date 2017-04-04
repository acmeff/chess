module SlidingPiece

  DIRECTIONS = {
    upper_right: [-1, 1],
    lower_right: [1, 1],
    upper_left: [-1, -1],
    lower_left: [1, -1],
    right: [0, 1],
    left: [0, -1],
    up: [-1, 0],
    down: [1, 0]
  }
  # RANKS = {
  #   upper_right: [-1, 1],
  #   lower_right: [1, 1],
  #   upper_left: [-1, -1],
  #   lower_left: [1, -1]
  # }
  def moves
    moves = []
    move_directions = move_dirs
    move_directions
    DIRECTIONS.keys.each {|key| moves += find_path(key) if move_directions.include?(key)}
    # DIAGONALS.keys.each {|key| moves += find_path(key)} if move_directions[0] == 1
    # RANKS.keys.each {|key| moves += find_path(key)} if move_directions[0] == 1
    moves
  end


  def find_path(dir)
    x, y = DIRECTIONS[dir]
    moves = []
    new_pos = position.dup

    path_clear = true
    while path_clear
      new_pos[0] += x
      new_pos[1] += y
      break unless board.valid_pos?(new_pos)
      if board[new_pos].is_a?(NullPiece)
        moves << new_pos.dup
      elsif board[new_pos].color == color
        path_clear = false
      elsif board[new_pos].color != color
        path_clear = false
        moves << new_pos.dup
      end
    end
    moves
  end


end
