class Player
  attr_reader :name, :piece
  MOVESET = [0,1,2,3,4,5,6,7,8]
  
  def initialize(piece, name, board)
    @name = name
    @piece = piece
    @board = board
  end

  def take_turn
    puts "Where would you like to place your #{@piece.inspect} piece?"
    loop do
      move = get_player_move
      if play_move(move, @piece)
        break
      else
        puts "Sorry, that cell is already taken, try again."
      end
    end
  end

  private

  def play_move(move, piece)
    @board.place_piece(move, piece)
  end

  def get_player_move
    loop do
      move = gets.chomp.to_i
      if move_valid?(move)
        return move
      else
        puts "Sorry, please enter a number between 0-8 to place a piece."
      end
    end
  end

  def move_valid?(move)
    if MOVESET.include?(move)
      true
    else
      false
    end
  end
end