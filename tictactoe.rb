require_relative 'board'
require_relative 'player'
require_relative 'computer_player'

class TicTacToe
  def initialize
    @board = Board.new
    put_welcome_message
    @board.display_board
    player_count = get_player_count
    if player_count == 2
      @player1 = Player.new('x', 'player1', @board)
      @player2 = Player.new('o', 'player2', @board)
    else
      @player1 = Player.new('x', 'player1', @board)
      @player2 = ComputerPlayer.new('o', @board)
    end
    @current_player = get_starting_player
    play_game
  end

  private

  def play_game
    loop do
      @current_player.take_turn
      @board.display_board
      if @board.winner?(@current_player)
        put_win_message(@current_player)
        break
      elsif @board.draw?
        put_draw_message
        break
      else
        change_current_player
      end
    end
    if play_again?
      TicTacToe.new
    end
  end

  def put_welcome_message
    welcome = <<-WELCOME
      Welcome to TicTacToe!
      The Objective of the game is to get a winning combo of 3 in either the horizontal, vertical or diagonal direction.
      Players take turns placing either a 'x' or 'o' symbol until a winning combo is played or the board fills (draw).
      Possible moves are 0 - 8 representing a cell from left to right starting at the top.
    WELCOME
    puts welcome.colorize(:yellow)
  end

  def put_win_message(winner)
    puts "Congratulations #{winner.name} has won!"
  end

  def put_draw_message
    puts "Looks like no-ones a winner today!"
  end

  def get_player_count
    puts "How many players will be playing? [1 or 2]"
    loop do
      count = gets.chomp.to_i
      if [1, 2].include?(count)
        return count
      else
        puts "Please choose either 1 or 2 players"
      end
    end
  end

  def get_starting_player
    starting_player = [@player1, @player2].sample
    puts "#{starting_player.name} won the draw, they'll go first using #{starting_player.piece.inspect} as their playpiece"
    starting_player
  end

  def change_current_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def play_again?
    puts "Would you like to play again? (y or n)"
    loop do
      response = gets.chomp
      if response == "y"
        return true
      elsif response =="n"
        return false
      else
        puts "Please enter y or n"
      end
    end
  end
end

TicTacToe.new