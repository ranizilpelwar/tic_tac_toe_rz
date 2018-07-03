require 'test/unit'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/available_spaces_rules.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'

class TestAvailableSpacesRules < Test::Unit::TestCase
  def test_get_available_spaces_raises_a_nil_reference_error_when_board_is_nil
    assert_raises(TicTacToeRZ::Exceptions::NilReferenceError) do TicTacToeRZ::GameRules::AvailableSpacesRules.get_available_spaces(nil) end
  end

  def test_alpha_character_is_not_a_valid_digit
    value = "A"
    result = TicTacToeRZ::GameRules::AvailableSpacesRules.digit?(value)
    assert_false(result, "An alpha character should not be marked as a valid digit.")
  end

  def test_space_character_is_not_a_valid_digit
    value = " "
    result = TicTacToeRZ::GameRules::AvailableSpacesRules.digit?(value)
    assert_false(result, "A space character should not be marked as a valid digit.")
  end

  def test_single_digit_character_is_a_valid_digit
    value = "1"
    result = TicTacToeRZ::GameRules::AvailableSpacesRules.digit?(value)
    assert(result, "A single digit character should be marked as a valid digit.")
  end

  def test_dual_digit_character_is_a_valid_digit
    value = "11"
    result = TicTacToeRZ::GameRules::AvailableSpacesRules.digit?(value)
    assert(result, "A dual digit character should be marked as a valid digit.")
  end

  def test_zero_is_a_valid_digit
    value = "0"
    result = TicTacToeRZ::GameRules::AvailableSpacesRules.digit?(value)
    assert(result, "A 0 should be marked as a valid digit.")
  end

  def test_negative_number_is_not_a_valid_digit_in_this_game
    value = "-1"
    result = TicTacToeRZ::GameRules::AvailableSpacesRules.digit?(value)
    assert_false(result, "A -1 should NOT be marked as a valid digit.")
  end

  def test_get_available_spaces_contains_one_element_when_there_is_only_one_available_spot_on_the_board
    board = ["X", "X", "X", "X", "X", "X", "X", "X", "9"]
    expected_result = 1
    available_spaces = TicTacToeRZ::GameRules::AvailableSpacesRules.get_available_spaces(board)
    actual_result = available_spaces.length
    assert_equal(expected_result, actual_result, "Errantly got #{actual_result} element(s) and list contains: #{available_spaces}.")
  end

  def test_get_available_spaces_contains_expected_index_when_there_is_only_one_available_spot_on_the_board
    board = ["X", "X", "X", "X", "X", "X", "X", "X", "9"]
    expected_result = 8
    available_spaces = TicTacToeRZ::GameRules::AvailableSpacesRules.get_available_spaces(board)
    actual_result = available_spaces[0]
    assert_equal(expected_result, actual_result, "Errantly got #{actual_result} as the index when expected to get #{expected_result}.")
  end

  def test_get_available_spaces_contains_zero_elements_when_there_are_no_available_spots_on_the_board
    board = ["X", "X", "X", "X", "X", "X", "X", "X", "X"]
    expected_result = 0
    available_spaces = TicTacToeRZ::GameRules::AvailableSpacesRules.get_available_spaces(board)
    actual_result = available_spaces.length
    assert_equal(expected_result, actual_result, "Errantly got #{actual_result} element(s) and it contains: #{available_spaces}.")
  end

  def test_get_available_spaces_contains_nine_elements_when_there_are_all_available_spots_on_the_board
    board = TicTacToeRZ::GamePlay::GameBoard.create_board
    expected_result = 9
    available_spaces = TicTacToeRZ::GameRules::AvailableSpacesRules.get_available_spaces(board)
    actual_result = available_spaces.length
    assert_equal(expected_result, actual_result, "Errantly got #{actual_result} element(s) and it contains: #{available_spaces}.")
  end
end