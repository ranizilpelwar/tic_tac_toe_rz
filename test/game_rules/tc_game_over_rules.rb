require 'test/unit'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/game_over_rules.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'

class TestGameOverValidation < Test::Unit::TestCase
  def test_game_over_raises_nil_reference_error_when_board_is_nil
    assert_raises(TicTacToeRZ::Exceptions::NilReferenceError) do TicTacToeRZ::GameRules::GameOverRules.game_over?(nil) end 
  end

  def test_game_is_over_when_first_row_on_board_contains_matching_tiles
    board = ["X", "X", "X", "X", "4", "5", "6", "7", "8", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_middle_row_on_board_contains_matching_tiles
    board = ["1", "2", "3", "X", "X", "X", "7", "8", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_last_row_on_board_contains_matching_tiles
    board = ["1", "2", "3", "4", "5", "6", "X", "X", "X"]
    assert(TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_first_column_on_board_contains_matching_tiles
    board = ["X", "2", "3", "X", "5", "6", "X", "8", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_last_column_on_board_contains_matching_tiles
    board = ["1", "2", "X", "4", "5", "X", "7", "8", "X"]
    assert(TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_middle_column_on_board_contains_matching_tiles
    board = ["1", "X", "3", "4", "X", "6", "7", "X", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_left_to_right_diagonal_on_board_contains_matching_tiles
    board = ["X", "2", "3", "4", "X", "6", "7", "8", "X"]
    assert(TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_over_when_right_to_left_diagonal_on_board_contains_matching_tiles
    board = ["1", "2", "X", "4", "X", "6", "X", "8", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected detection of game over.")
  end

  def test_game_is_not_over_when_there_are_no_matching_tiles_on_board
    board = ["1", "2", "3", "4", "X", "6", "X", "8", "9"]
    assert(!TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected game over to be false.")
  end

  def test_game_is_not_over_on_brand_new_unplayed_board
    board = TicTacToeRZ::GamePlay::GameBoard.create_board
    assert(!TicTacToeRZ::GameRules::GameOverRules.game_over?(board), "Expected game over to be false.")
  end

  def test_win_for_player_raises_nil_reference_error_when_provided_board_is_nil
    assert_raises(TicTacToeRZ::Exceptions::NilReferenceError) do TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", nil) end 
  end

  def test_win_for_player_raises_invalid_value_error_when_provided_player_symbol_is_invalid
    board = TicTacToeRZ::GamePlay::GameBoard.create_board
    assert_raises(TicTacToeRZ::Exceptions::InvalidValueError) do TicTacToeRZ::GameRules::GameOverRules.win_for_player?("1", board) end 
  end

  def test_win_for_player_returns_false_on_brand_new_unplayed_board
    board = TicTacToeRZ::GamePlay::GameBoard.create_board
    assert(!TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", board), "Expected false to be returned on unplayed board.")
  end

  def test_provided_player_wins_when_first_row_on_board_contains_matching_tiles
    board = ["X", "X", "X", "4", "5", "6", "7", "8", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_middle_row_on_board_contains_matching_tiles
    board = ["1", "2", "3", "X", "X", "X", "7", "8", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_last_row_on_board_contains_matching_tiles
    board = ["1", "2", "3", "4", "5", "6", "X", "X", "X"]
    assert(TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_first_column_on_board_contains_matching_tiles
    board = ["X", "2", "3", "X", "5", "6", "X", "8", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_last_column_on_board_contains_matching_tiles
    board = ["1", "2", "X", "4", "5", "X", "7", "8", "X"]
    assert(TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_middle_column_on_board_contains_matching_tiles
    board = ["1", "X", "3", "4", "X", "6", "7", "X", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_left_to_right_diagonal_on_board_contains_matching_tiles
    board = ["X", "2", "3", "4", "X", "6", "7", "8", "X"]
    assert(TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_wins_when_right_to_left_diagonal_on_board_contains_matching_tiles
    board = ["1", "2", "X", "4", "X", "6", "X", "8", "9"]
    assert(TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", board), "Expected detection of win.")
  end

  def test_provided_player_doesnt_win_when_there_are_no_matching_tiles_on_board_for_that_player
    board = ["1", "2", "X", "4", "X", "6", "X", "8", "9"]
    assert(!TicTacToeRZ::GameRules::GameOverRules.win_for_player?("Y", board), "Expected method to return false.")
  end
end
