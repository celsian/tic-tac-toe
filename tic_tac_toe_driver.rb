require_relative 'tic_tac_toe'

class TicTacToeDriver
  win_count = { "X" => 0, "O" => 0 }

  g = Game.new
  (0..2).each do |x|
    (0..2).each do |y|
      g.move(x.to_s + y.to_s)
    end
  end
  win_count[g.board.winner?] += 1

  g1 = Game.new
  g1.move("00")#O
  g1.move("01")#X
  g1.move("02")#O
  g1.move("10")#X
  g1.move("11")#O
  g1.move("20")#X
  g1.move("12")#O
  g1.move("22")#X
  g1.move("21")#O
  
  g1.board.winner? ? win_count[] += 1 : nil

  puts win_count
end