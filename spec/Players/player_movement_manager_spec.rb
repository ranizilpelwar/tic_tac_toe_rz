require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/Players/player_movement_manager.rb'
require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

RSpec.describe "a player movement manager" do
  before(:example) do
    @player1_type = TicTacToeRZ::PlayerType.new(:Human)
    @player2_type = TicTacToeRZ::PlayerType.new(:Computer)
    @type_of_match = TicTacToeRZ::MatchType.new(@player1_type, @player2_type)
    @player_movement_manager = TicTacToeRZ::PlayerMovementManager.new(@type_of_match)
  end

  context "initialization" do
    it "raises a NilReferenceError when type of match is nil" do
      type_of_match = nil
      expect{ TicTacToeRZ::PlayerMovementManager.new(type_of_match) }.to raise_error(TicTacToeRZ::NilReferenceError)
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
      expect{@player_movement_manager.get_last_move_for_player(0)}.to raise_error(TicTacToeRZ::InvalidValueError)
    end

    it "raises an InvalidValueError when player number is -1" do
      expect{@player_movement_manager.get_last_move_for_player(-1)}.to raise_error(TicTacToeRZ::InvalidValueError)
    end

    it "raises an InvalidValueError when player number is 3" do
      expect{@player_movement_manager.get_last_move_for_player(3)}.to raise_error(TicTacToeRZ::InvalidValueError)
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
      move = TicTacToeRZ::PlayerMovementManager::LARGEST_INDEX
      @player_movement_manager.update_last_move_for_player(player_number, move)
      expect(@player_movement_manager.get_last_move_for_player(player_number)).to eq(move)
    end
  end

  context "method called any_moves_to_undo?" do
    it "raises a GameRuleViolationError when undo_last_move is called when there are no moves to undo" do
      game_board = double()
      player_manager = double()
      expect{@player_movement_manager.undo_last_move(game_board, player_manager)}.to raise_error(TicTacToeRZ::GameRuleViolationError)
    end
  end

  context "method called number_of_human_players" do
    it "returns 2 for a Human vs Human match type" do
      match_manager = TicTacToeRZ::MatchTypeManager.new
      match_type = match_manager.get_match_type(1)
      player_movement_manager = TicTacToeRZ::PlayerMovementManager.new(match_type)
      count = player_movement_manager.number_of_human_players
      expect(count).to eq(2)
    end

    it "returns 1 for a Human vs Computer match type" do
      match_manager = TicTacToeRZ::MatchTypeManager.new
      match_type = match_manager.get_match_type(2)
      player_movement_manager = TicTacToeRZ::PlayerMovementManager.new(match_type)
      count = player_movement_manager.number_of_human_players
      expect(count).to eq(1)
    end

    it "returns 0 for a Computer vs Computer match type" do
      match_manager = TicTacToeRZ::MatchTypeManager.new
      match_type = match_manager.get_match_type(3)
      player_movement_manager = TicTacToeRZ::PlayerMovementManager.new(match_type)
      count = player_movement_manager.number_of_human_players
      expect(count).to eq(0)
    end
  end
end