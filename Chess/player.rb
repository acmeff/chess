


class Player
attr_accessor :color, :cursor
  def initialize
    @color = nil
    @cursor = nil
  end

  def play_move
    start_pos = nil
    until start_pos
      start_pos = cursor.get_input

    end
  end_pos = nil

  until end_pos
    end_pos = cursor.get_input

  end
  p [start_pos, end_pos]
  [start_pos, end_pos]

  end


end
