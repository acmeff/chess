require_relative 'piece'

class Pawn < Piece
  def moves
    moves = []
    x , y = position
    dirs = move_dirs


    x1 = position[0] + dirs[0][0]
    if board[[x1,y]].is_a?(NullPiece)
      moves << [x1, y]
    end


    if color == :white && position[0] == 1 || color == :black && position[0] == 6
      x2 = position[0] + dirs[1][0]

      if board[[x2, y]].is_a?(NullPiece)
        moves << [x2, y]
      end

    end


    left_diag = [x + dirs[3][0], y + dirs[3][1]]
    right_diag = [x + dirs[2][0], y + dirs[2][1]]
    if board.valid_pos?(left_diag)
      if board[left_diag].symbol == :piece && board[left_diag].color != color
        moves << left_diag
      end
    end
    if board.valid_pos?(right_diag)
      if board[right_diag].symbol == :piece && board[right_diag].color != color
        moves << right_diag
      end
    end
    valid_moves(moves)
  end

  def move_dirs
    dirs = []
    if color == :white
      dirs = [[1, 0], [2, 0], [1, 1], [1, -1]]
    else
      dirs = [[-1, 0], [-2, 0], [-1, 1], [-1, -1]]
    end
    dirs

  end

  def render
    if color == :white
      "[\u2659]"
    else
      "[\u265F]"
    end
  end
end
