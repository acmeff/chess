require_relative 'board'
require_relative 'display'
require_relative 'player'

class Chess
  attr_reader :board, :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one, @player_two = player_one, player_two
    player_one.color = :white
    player_two.color = :black
    @board = Board.new
    board.place_pieces
    @display = Display.new(board)
    player_one.cursor = @display.cursor
    player_two.cursor = @display.cursor
    @current_player = player_one
  end


  def switch_player
    @current_player = @current_player == player_one ? player_two : player_one
  end

  def play_turn
    move = @current_player.play_move
    if board.valid_pos?(move.first) && board[move.first].color == @current_player.color
      possible_moves = board[move.first].moves

      if possible_moves.include?(move.last)
        new_board = board.dup
        new_board.move_piece(move.first, move.last)
        if new_board.in_check?(@current_player.color)
          puts "Invalid move"
        else
          board.move_piece(move.first, move.last)
          switch_player
        end
      end
    end


  end

  def play

    @display.render
    until board.checkmate?(@current_player.color)
      play_turn
      @display.render
    end
    puts "#{@current_player.name} checkmated"
  end




end
player1 = Player.new
player2 = Player.new
game = Chess.new(player1, player2)
game.play
