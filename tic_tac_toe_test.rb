require 'minitest/autorun'
require_relative 'tic_tac_toe'

class TicTacToeTest < Minitest::Test
  describe Board do  
    before do
      @board = Board.new
    end

    def test_empty_board
      assert_equal nil, @board.winner?
    end

    def test_empty_row
      @board.board = [
        ["", "", ""],
        ["O", "A", "O"],
        ["X", "X", "X"]
      ]
      assert_equal "X", @board.winner?
    end

    def test_diagonal_winner_01
      @board.board = [
        ["O", "O", "X"],
        ["O", "X", "O"],
        ["X", "O", "O"]
      ]
      assert_equal "X", @board.winner?
    end

    def test_diagonal_winner_02
      @board.board = [
        ["X", "O", "O"],
        ["O", "X", "O"],
        ["X", "O", "X"]
      ]
      assert_equal "X", @board.winner?
    end

    def test_veritcal_winner_01
      @board.board = [
        ["X", "O", "X"],
        ["O", "A", "X"],
        ["X", "O", "X"]
      ]
      assert_equal "X", @board.winner?
    end

    def test_horizontal_winner_01
      @board.board = [
        ["X", "X", "X"],
        ["O", "A", "O"],
        ["X", "O", "X"]
      ]
      assert_equal "X", @board.winner?
    end
  end

end