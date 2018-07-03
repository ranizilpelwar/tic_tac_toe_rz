require 'test/unit'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/evaluators/board_score_evaluator.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'

class BoardScoreEvaluation < Test::Unit::TestCase

  def test_evaluate_score_of_board_raises_a_nil_reference_error_when_board_is_nil
    assert_raises(TicTacToeRZ::Exceptions::NilReferenceError) do TicTacToeRZ::Evaluators::BoardScoreEvaluator.score_of_board(nil, "X", "Y") end
  end

  def test_evaluate_score_of_board_raises_an_invalid_value_error_when_symbol_of_current_player_is_invalid
    board = TicTacToeRZ::GamePlay::GameBoard.create_board
    assert_raises(TicTacToeRZ::Exceptions::InvalidValueError) do TicTacToeRZ::Evaluators::BoardScoreEvaluator.score_of_board(board, "1", "Y") end
  end

  def test_evaluate_score_of_board_raises_an_invalid_value_error_when_symbol_of_other_player_is_invalid
    board = TicTacToeRZ::GamePlay::GameBoard.create_board
    assert_raises(TicTacToeRZ::Exceptions::InvalidValueError) do TicTacToeRZ::Evaluators::BoardScoreEvaluator.score_of_board(board, "X", "1") end
  end

  def test_evaluate_score_of_line_raises_a_nil_reference_error_when_board_is_nil
    indexes = []
    assert_raises(TicTacToeRZ::Exceptions::NilReferenceError) do TicTacToeRZ::Evaluators::BoardScoreEvaluator.score_of_line(nil, indexes, "X", "Y") end
  end

  def test_evaluate_score_of_line_raises_a_nil_reference_error_when_indexes_is_nil
    board = TicTacToeRZ::GamePlay::GameBoard.create_board
    assert_raises(TicTacToeRZ::Exceptions::NilReferenceError) do TicTacToeRZ::Evaluators::BoardScoreEvaluator.score_of_line(board, nil, "X", "Y") end
  end

  def test_evaluate_score_of_line_raises_an_invalid_value_error_when_symbol_of_current_player_is_invalid
    board = TicTacToeRZ::GamePlay::GameBoard.create_board
    indexes = []
    assert_raises(TicTacToeRZ::Exceptions::InvalidValueError) do TicTacToeRZ::Evaluators::BoardScoreEvaluator.score_of_line(board, indexes, "1", "Y") end
  end

  def test_evaluate_score_of_line_raises_an_invalid_value_error_when_symbol_of_other_player_is_invalid
    board = TicTacToeRZ::GamePlay::GameBoard.create_board
    indexes = []
    assert_raises(TicTacToeRZ::Exceptions::InvalidValueError) do TicTacToeRZ::Evaluators::BoardScoreEvaluator.score_of_line(board, indexes, "X", "1") end
  end
end