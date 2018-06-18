require 'test/unit'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player_manager.rb'

class TestPlayerManagerInitialization < Test::Unit::TestCase
  
  def setup
    @player1 = TicTacToeRZ::Player.new(:Human, "X")
    @player2 = TicTacToeRZ::Player.new(:Computer, "Y")
    @player_manager = TicTacToeRZ::PlayerManager.new(@player1, @player2)
  end

  def test_player_manager_initialization_sets_player1_to_the_given_value
    assert_equal(@player1, @player_manager.player1)
  end

  def test_player_manager_initialization_sets_player2_to_the_given_value
    assert_equal(@player2, @player_manager.player2)
  end

  def test_player_manager_initialization_sets_current_player_to_the_first_player
    assert_equal(@player1, @player_manager.current_player)
  end
end
