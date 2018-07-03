require 'test/unit'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/tie_game_rules.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'

class TestTieGameValidation < Test::Unit::TestCase
  def test_tie_game_raises_error_when_provided_board_is_nil
    assert_raises(TicTacToeRZ::NilReferenceError) do TicTacToeRZ::GameRules::TieGameRules.tie_game?(nil) end
  end

  def test_tie_game_returns_false_on_brand_new_unplayed_board
    board = TicTacToeRZ::GameBoard.create_board
    assert(!TicTacToeRZ::GameRules::TieGameRules.tie_game?(board), "Expected false to be returned on unplayed board.")
  end

  def test_tie_game_happens_when_there_are_no_unoccupied_tiles_on_board_with_no_win
    board = ["Y", "X", "Y", "X", "X", "Y", "Y", "Y", "X"]
    assert(TicTacToeRZ::GameRules::TieGameRules.tie_game?(board), "Expected detection of tie game.")
  end

  def test_tie_game_is_false_when_there_are_no_unoccupied_tiles_on_board_and_someone_won
    board = ["Y", "X", "Y", "Y", "X", "Y", "Y", "Y", "X"]
    assert(!TicTacToeRZ::GameRules::TieGameRules.tie_game?(board), "Since player Y won, it is not a tie game.")
  end

  def test_tie_game_returns_false_when_there_is_an_unoccupied_tile_on_board
    board = ["X", "X", "3", "X", "Y", "Y", "Y", "Y", "Y"]
    assert(!TicTacToeRZ::GameRules::TieGameRules.tie_game?(board), "Expected tie game to return false as there is one available tile on the board.")
  end
end
