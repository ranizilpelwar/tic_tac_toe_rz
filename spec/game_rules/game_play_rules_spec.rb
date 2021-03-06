require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/game_play_rules.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb'
require_relative '../../test/players/mock_player_manager.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'

RSpec.describe "a game play validator" do
  
  before(:example) do
    board = [ "0", "1", "2",
              "3", "X", "5",
              "O", "X", "O" ]
    @game_board = TicTacToeRZ::GamePlay::GameBoard.new(board)
  end
  
  shared_examples "evaluate_move" do |description, value, expected|
    it "returns #{expected} when tile is #{description}" do
      expect(TicTacToeRZ::GameRules::GamePlayRules.evaluate_move(@game_board, value).is_valid_move).to be expected
    end
  end

  context "method called evaluate_move" do
    it "raises a NilReferenceError when game board is nil" do
      expect{ TicTacToeRZ::GameRules::GamePlayRules.evaluate_move(nil, "1") }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "returns two elements" do
      result = TicTacToeRZ::GameRules::GamePlayRules.evaluate_move(@game_board, "1")
      expected_length = 2
      expect(result.length).to eq(expected_length)
    end

    include_examples "evaluate_move", "occupied", "4", false
    include_examples "evaluate_move", "an alpha character", "X", false
    include_examples "evaluate_move", "an out-of-bounds value", "10", false
    include_examples "evaluate_move", "unoccupied", "0", true

    it "returns_correct_index_when_tile_is_unoccupied" do
      expect(TicTacToeRZ::GameRules::GamePlayRules.evaluate_move(@game_board, "0").index_of_board).to eq(0)
    end
  end

  context "method called winning_game?" do
    it "raises a NilReferenceError when game board is nil" do
      available_spaces = [0, 1]
      expect{ TicTacToeRZ::GameRules::GamePlayRules.winning_game?("X", nil, available_spaces) }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "raises a NilReferenceError when available spaces is nil" do
      expect{ TicTacToeRZ::GameRules::GamePlayRules.winning_game?("X", @game_board.board, nil) }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "raises an InvalidValueError when player symbol is invalid" do
      available_spaces = [0, 1]
      expect{ TicTacToeRZ::GameRules::GamePlayRules.winning_game?("1", @game_board.board, available_spaces) }.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "returns two elements" do
      available_spaces = [0, 1, 2, 3, 5]
      result = TicTacToeRZ::GameRules::GamePlayRules.winning_game?("X", @game_board.board, available_spaces)
      expected_length = 2
      expect(result.length).to eq(expected_length)
    end

    it "returns true when winning move can be made" do
      available_spaces = [0, 1]
      result = TicTacToeRZ::GameRules::GamePlayRules.winning_game?("X", @game_board.board, available_spaces)
      expect(result.is_valid_move).to be true
    end

    it "returns correct index when winning move can be made" do
      available_spaces = [0, 1]
      result = TicTacToeRZ::GameRules::GamePlayRules.winning_game?("X", @game_board.board, available_spaces)
      expect(result.index_of_board).to eq(1)
    end

    it "returns false when winning move cannot be made" do
      available_spaces = [0, 5]
      result = TicTacToeRZ::GameRules::GamePlayRules.winning_game?("X", @game_board.board, available_spaces)
      expect(result.is_valid_move).to be false
    end

    it "returns negative one when winning move cannot be made" do
      available_spaces = [0, 5]
      result = TicTacToeRZ::GameRules::GamePlayRules.winning_game?("X", @game_board.board, available_spaces)
      expect(result.index_of_board).to eq(-1)
    end

    it "returns false when available spaces is empty" do
      available_spaces = []
      result = TicTacToeRZ::GameRules::GamePlayRules.winning_game?("X", @game_board.board, available_spaces)
      expect(result.is_valid_move).to be false
    end
  end
end