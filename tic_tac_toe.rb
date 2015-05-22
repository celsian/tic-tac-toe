class Game
  attr_accessor :board, :player1, :player2, :move_count

  def initialize
    @board = Board.new
    @player1 = Player.new("O")
    @player2 = Player.new("X")
    @move_count = 0
    puts "Game is starting:"
    go
  end

  def go
    @board.pp
    puts "It's #{move_count.even? ? @player1.xo : @player2.xo}'s turn"
    # move(gets.chomp)
  end

  def move(location_input)
    if location_input.length != 2 || location_input =~ /[^0-2]/
      puts "Invalid Input, try again."
      go
    end
    loc = location_input.split("")
    if (@board.board[loc.first.to_i][loc.last.to_i]).empty?
      @board.board[loc.first.to_i][loc.last.to_i] = move_count.even? ? @player1.xo : @player2.xo
      @move_count += 1
    else
      puts "That location is taken or doesnt exist, dumbass."
    end

    if @board.winner? || @move_count == 9
      win
    else
      go
    end
  end

  def win
    @board.pp
    if @board.winner?
      puts "Yo, the #{@board.winner?}'s won!"
    else
      puts "Cat's game. :("
    end
  end

end

class Player
  attr_reader :xo

  def initialize(x_or_o)
    @xo = x_or_o
  end
end

class Board 
  attr_accessor :board, :total_moves

  def initialize
    @board = [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""]
    ]
    @total_moves = 0
  end

  def set_board(board)
    @board = board
  end

  def winner?
    horizontal_winner || vertical_winner || diagonal_winner
  end

  def horizontal_winner
    (0..2).each do |i|
      if @board[i][0] == @board[i][1] && @board[i][0] == @board[i][2]
        @board[i][0].empty? ? nil : (return @board[i][0])
      end
    end

    false
  end

  def vertical_winner
    (0..2).each do |i|
      if @board[0][i] == @board[1][i] && @board[0][i] == @board[2][i]
        @board[0][i].empty? ? nil : (return @board[0][i])
      end
    end

    false
  end

  def diagonal_winner
    if @board[0][0] == @board[1][1] && @board[0][0] == @board[2][2]
      @board[0][0].empty? ? nil : @board[0][0]
    elsif @board[0][2] == @board[1][1] && @board[0][2] == @board[2][0]
      @board[0][2].empty? ? nil : @board[0][2]
    end
  end

  def pp #pretty_print
    (0..2).each do |i|
      puts "#{board[i][0].empty? ? " " : board[i][0] } | #{board[i][1].empty? ? " " : board[i][1]} | #{board[i][2].empty? ? " " : board[i][2]}"
      unless i == 2
        puts "---------"
      end
    end
  end

end