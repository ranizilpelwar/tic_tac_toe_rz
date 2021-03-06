require 'test/unit'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type_manager.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'

class TestMatchTypeManager < Test::Unit::TestCase
  def test_initialize_creates_a_total_of_three_match_types
    expected_length = 3
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    actual_length = match_type_manager.matches.length
    assert_equal(expected_length, actual_length, "Total 3 matches should be created.")
  end

  def test_get_total_available_matches_should_return_a_value_of_three
    expected_total = 3
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    actual_total = match_type_manager.get_total_available_matches
    assert_equal(expected_total, actual_total)
  end

  def test_when_match_number_is_provided_as_zero_then_an_invalid_value_error_is_raised
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    assert_raises TicTacToeRZ::Exceptions::InvalidValueError do match_type_manager.get_match_type(0) end
  end

  def test_when_match_number_is_provided_as_four_then_an_invalid_value_error_is_raised
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    assert_raises TicTacToeRZ::Exceptions::InvalidValueError do match_type_manager.get_match_type(4) end
  end

  def test_when_match_number_is_one_then_human_vs_human_match_type_is_returned
    expected_player1_type = :Human
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    actual_match_type = match_type_manager.get_match_type(1)
    actual_player1_type = actual_match_type.player1_type.selected_option
    assert_equal(expected_player1_type, actual_player1_type, "Player 1 type for first match should be Human.")
  end

  def test_when_match_number_is_provided_as_four_then_it_is_not_a_valid_match
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    assert_false(match_type_manager.valid?(4), "This should not be a valid match.")
  end

  def test_when_match_number_is_provided_as_one_then_it_is_a_valid_match
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    assert(match_type_manager.valid?(1), "This should be a valid match.")
  end

  def test_when_match_number_is_provided_as_zero_then_it_is_not_a_valid_match
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    assert_false(match_type_manager.valid?(0), "This should not be a valid match.")
  end

  def test_returns_correct_player_type_for_Human_vs_Computer_match_and_player_number_one
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    match_number = 2
    player_number = 1
    assert_equal(match_type_manager.player_type(match_number, player_number), "Human")
  end

  def test_returns_correct_player_type_for_Human_vs_Computer_match_and_player_number_two
    match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
    match_number = 2
    player_number = 2
    assert_equal(match_type_manager.player_type(match_number, player_number), "Computer")
  end
end