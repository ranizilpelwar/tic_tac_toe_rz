require 'test/unit'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/player_type_error.rb'

class TestPlayerType < Test::Unit::TestCase
  
  def test_player_type_sets_selected_option_to_human_when_it_is_used_during_initialization

    expected_option = :Human
    playerType = TicTacToeRZ::Players::PlayerType.new(expected_option)

    assert_equal(expected_option, playerType.selected_option, 'Human should be selected.')
  end

  def test_player_type_sets_selected_option_to_computer_when_it_is_used_during_initialization

    expected_option = :Computer
    playerType = TicTacToeRZ::Players::PlayerType.new(expected_option)

    assert_equal(expected_option, playerType.selected_option, 'Computer should be selected.')
  end

  def test_player_type_initialization_raises_PlayerTypeError_when_created_as_a_robot

    assert_raises(TicTacToeRZ::Exceptions::InvalidValueError) { TicTacToeRZ::Players::PlayerType.new(:Robot) }
  end

  def test_valid_returns_true_when_human_is_entered_as_a_parameter

    option = :Human

    assert(TicTacToeRZ::Players::PlayerType.valid?(option))
  end

  def test_valid_returns_true_when_computer_is_entered_as_a_parameter

    option = :Computer

    assert(TicTacToeRZ::Players::PlayerType.valid?(option))
  end

  def test_valid_returns_false_when_robot_is_entered_as_a_parameter

    option = :Robot

    assert(!TicTacToeRZ::Players::PlayerType.valid?(option))
  end
end

