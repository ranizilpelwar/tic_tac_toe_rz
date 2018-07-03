require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player_movement_manager.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type_manager.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/game_rule_violation_error.rb'
require_relative '../../test/players/mock_player_manager.rb'

RSpec.describe "a player movement manager" do
  before(:example) do
    @player1_type = TicTacToeRZ::Players::PlayerType.new(:Human)
    @player2_type = TicTacToeRZ::Players::PlayerType.new(:Computer)
    @type_of_match = TicTacToeRZ::GamePlay::MatchType.new(@player1_type, @player2_type)
    @player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(@type_of_match)
  end

  context "initialization" do
    it "raises a NilReferenceError when type of match is nil" do
      type_of_match = nil
      expect{ TicTacToeRZ::Players::PlayerMovementManager.new(type_of_match) }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "sets last move of player1 to -1" do
      expect(@player_movement_manager.player1_last_move).to eq(-1)
    end

    it "sets last move of player2 to -1" do
      expect(@player_movement_manager.player2_last_move).to eq(-1)
    end

    it "sets match type to provided value when it is valid" do
      expect(@player_movement_manager.match_type).to eq(@type_of_match)
    end
  end

  context "method called get_last_move_for_player" do
    it "raises an InvalidValueError when player number is 0" do
      expect{@player_movement_manager.get_last_move_for_player(0)}.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "raises an InvalidValueError when player number is -1" do
      expect{@player_movement_manager.get_last_move_for_player(-1)}.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "raises an InvalidValueError when player number is 3" do
      expect{@player_movement_manager.get_last_move_for_player(3)}.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "returns last move for player1 when player number is set to 1" do
      player_number = 1
      updated_move = 5
      @player_movement_manager.update_last_move_for_player(player_number, updated_move)
      expect(@player_movement_manager.get_last_move_for_player(player_number)).to eq(updated_move)
    end

    it "returns last move for player2 when player number is set to 2" do
      player_number = 2
      updated_move = 5
      @player_movement_manager.update_last_move_for_player(player_number, updated_move)
      expect(@player_movement_manager.get_last_move_for_player(player_number)).to eq(updated_move)
    end

    it "updates last move when move is 0" do
      player_number = 1
      move = 0
      @player_movement_manager.update_last_move_for_player(player_number, move)
      expect(@player_movement_manager.get_last_move_for_player(player_number)).to eq(move)
    end

    it "updates last move when move is the same as the largest index" do
      player_number = 1
      move = TicTacToeRZ::Players::PlayerMovementManager::LARGEST_INDEX
      @player_movement_manager.update_last_move_for_player(player_number, move)
      expect(@player_movement_manager.get_last_move_for_player(player_number)).to eq(move)
    end
  end

  context "method called any_moves_to_undo?" do
    it "raises a GameRuleViolationError when undo_last_move is called when there are no moves to undo" do
      game_board = double()
      player_manager = double()
      expect{@player_movement_manager.undo_last_move(game_board, player_manager)}.to raise_error(TicTacToeRZ::Exceptions::GameRuleViolationError)
    end
  end

  context "method called number_of_human_players" do
    it "returns 2 for a Human vs Human match type" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(1)
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      count = player_movement_manager.number_of_human_players
      expect(count).to eq(2)
    end

    it "returns 1 for a Human vs Computer match type" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(2)
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      count = player_movement_manager.number_of_human_players
      expect(count).to eq(1)
    end

    it "returns 0 for a Computer vs Computer match type" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(3)
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      count = player_movement_manager.number_of_human_players
      expect(count).to eq(0)
    end
  end

  context "method called undo_last_move" do
    it "raises a NilReferenceError when game_board is nil" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(3)
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      expect{ player_movement_manager.undo_last_move(nil, double()) }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "raises a NilReferenceError when player_manager is nil" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(3)
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      expect{ player_movement_manager.undo_last_move(double(), nil) }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "resets the last move for both players in a Human vs Computer match" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(2)
      game_board = TicTacToeRZ::GamePlay::GameBoard.new(["X", "2", "3", "O", "5", "6", "7", "8", "9"])
      player_manager = MockPlayerManager.new
      player_manager.update_current_player
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      player_movement_manager.update_last_move_for_player(1, 3)
      player_movement_manager.update_last_move_for_player(2, 0)
      player_movement_manager.undo_last_move(game_board, player_manager)
      expect(player_movement_manager.get_last_move_for_player(1)).to eq(-1)
      expect(player_movement_manager.get_last_move_for_player(2)).to eq(-1)
    end

    it "resets the last move for only the current player in a Human vs Human match" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(1)
      game_board = TicTacToeRZ::GamePlay::GameBoard.new(["X", "2", "3", "O", "5", "6", "7", "8", "9"])
      human = TicTacToeRZ::Players::PlayerType.new(:Human)
      player_manager = TicTacToeRZ::Players::PlayerManager.new(TicTacToeRZ::Players::Player.new(human, "X"), TicTacToeRZ::Players::Player.new(human, "O"))
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      player_movement_manager.update_last_move_for_player(1, 0)
      player_movement_manager.update_last_move_for_player(2, 3)
      player_movement_manager.undo_last_move(game_board, player_manager)
      expect(player_movement_manager.get_last_move_for_player(1)).to eq(-1)
      expect(player_movement_manager.get_last_move_for_player(2)).to eq(3)
    end

    it "raises a GameRuleViolationError in a Computer vs Computer match" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(3)
      game_board = TicTacToeRZ::GamePlay::GameBoard.new(["X", "2", "3", "O", "5", "6", "7", "8", "9"])
      computer = TicTacToeRZ::Players::PlayerType.new(:Computer)
      player_manager = TicTacToeRZ::Players::PlayerManager.new(TicTacToeRZ::Players::Player.new(computer, "X"), TicTacToeRZ::Players::Player.new(computer, "O"))
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      player_movement_manager.update_last_move_for_player(1, 0)
      player_movement_manager.update_last_move_for_player(2, 3)
      expect{ player_movement_manager.undo_last_move(game_board, player_manager) }.to raise_error(TicTacToeRZ::Exceptions::GameRuleViolationError)
    end

    it "reverts only the two tiles corresponding to the last moves for both players in a Human vs Computer match" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(2)
      game_board = TicTacToeRZ::GamePlay::GameBoard.new(["X", "X", "O", "O", "5", "X", "O", "8", "9"])
      player_manager = MockPlayerManager.new
      player_manager.update_current_player
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      player_movement_manager.update_last_move_for_player(1, 3)
      player_movement_manager.update_last_move_for_player(2, 0)
      player_movement_manager.undo_last_move(game_board, player_manager)
      expected_board = ["1", "X", "O", "4", "5", "X", "O", "8", "9"]
      expect(game_board.board).to eq(expected_board)
    end

    it "reverts only the one tile for the first Human player in a Human vs Human match when she is the current player" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(1)
      game_board = TicTacToeRZ::GamePlay::GameBoard.new(["X", "X", "O", "O", "5", "X", "O", "8", "9"])
      human = TicTacToeRZ::Players::PlayerType.new(:Human)
      player_manager = TicTacToeRZ::Players::PlayerManager.new(TicTacToeRZ::Players::Player.new(human, "X"), TicTacToeRZ::Players::Player.new(human, "O"))
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      player_movement_manager.update_last_move_for_player(1, 0)
      player_movement_manager.update_last_move_for_player(2, 3)
      player_movement_manager.undo_last_move(game_board, player_manager)
      expected_board = ["1", "X", "O", "O", "5", "X", "O", "8", "9"]
      expect(game_board.board).to eq(expected_board)
    end

    it "reverts only the one tile for the second Human player in a Human vs Human match when she is the current player" do
      match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
      match_type = match_manager.get_match_type(1)
      game_board = TicTacToeRZ::GamePlay::GameBoard.new(["X", "X", "O", "O", "5", "X", "O", "8", "9"])
      human = TicTacToeRZ::Players::PlayerType.new(:Human)
      player_manager = TicTacToeRZ::Players::PlayerManager.new(TicTacToeRZ::Players::Player.new(human, "X"), TicTacToeRZ::Players::Player.new(human, "O"))
      player_manager.update_current_player
      player_movement_manager = TicTacToeRZ::Players::PlayerMovementManager.new(match_type)
      player_movement_manager.update_last_move_for_player(1, 0)
      player_movement_manager.update_last_move_for_player(2, 3)
      player_movement_manager.undo_last_move(game_board, player_manager)
      expected_board = ["X", "X", "O", "4", "5", "X", "O", "8", "9"]
      expect(game_board.board).to eq(expected_board)
    end
  end
end