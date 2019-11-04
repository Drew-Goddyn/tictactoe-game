require 'colorize'
class Board
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end

  WIN_COMBOS = [
    [0, 1, 2], # horizontals
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6], # verticals
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8], # diagonals
    [2, 4, 6]
  ]

  def display_board
    pretty_board = pretty_up_board(@board)
    board = <<-BOARD
      -------------
      | #{pretty_board[0]} | #{pretty_board[1]} | #{pretty_board[2]} |
      -------------
      | #{pretty_board[3]} | #{pretty_board[4]} | #{pretty_board[5]} |
      -------------
      | #{pretty_board[6]} | #{pretty_board[7]} | #{pretty_board[8]} |
      -------------
    BOARD
    puts board
  end

  def place_piece(cell, piece)
    if cell_available?(cell)
      @board[cell] = piece
    else
      false
    end
  end

  def winner?(player) #replace with player.piece once its built
    WIN_COMBOS.any? do |combo|
      combo.all? { |cell| @board[cell] == player.piece }
    end
  end

  def draw?
    if @board.include?(" ")
      false
    else
      true
    end
  end

  private
  def pretty_up_board(board)
    board.each_with_index.map do |cell, index|
      if cell == " "
        index
      elsif cell == "x"
        cell.colorize(:blue)
      else
        cell.colorize(:red)
      end
    end
  end
  def cell_available?(cell)
    if @board[cell] == " "
      true
    else
      false
    end
  end
end
