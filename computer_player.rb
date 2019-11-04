class ComputerPlayer < Player
  def initialize(piece, board)
    @name = "borg"
    @piece = piece
    @board = board
  end

  def take_turn
    puts "Borg taking turn, resistance is futile!"
    move = rand(0..8)
    loop do
      if play_move(move, @piece)
        break
      else
        move = rand(0..8)
      end
    end
  end
end