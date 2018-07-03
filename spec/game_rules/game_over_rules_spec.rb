require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/game_over_rules.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'

RSpec.describe "a game over validator" do
  
  shared_examples "game_over?" do |description, board, expected|
    it "returns #{expected} when #{description}" do
      expect(TicTacToeRZ::GameRules::GameOverRules.game_over?(board)).to be expected
    end
  end

  context "method called game_over?" do
    it "raises an NilReferenceError when board is nil" do
      expect{ TicTacToeRZ::GameRules::GameOverRules.game_over?(nil) }.to raise_error(TicTacToeRZ::NilReferenceError)
    end
  
    include_examples "game_over?", "first row contains matching tiles", ["X", "X", "X", "X", "4", "5", "6", "7", "8", "9"], true
    include_examples "game_over?", "middle row contains matching tiles", ["1", "2", "3", "X", "X", "X", "7", "8", "9"], true
    include_examples "game_over?", "last row contains matching tiles", ["1", "2", "3", "4", "5", "6", "X", "X", "X"], true
    include_examples "game_over?", "first column contains matching tiles", ["X", "2", "3", "X", "5", "6", "X", "8", "9"], true
    include_examples "game_over?", "middle column contains matching tiles", ["1", "X", "3", "4", "X", "6", "7", "X", "9"], true
    include_examples "game_over?", "last column contains matching tiles", ["1", "2", "X", "4", "5", "X", "7", "8", "X"], true
    include_examples "game_over?", "left to right diagonal contains matching tiles", ["X", "2", "3", "4", "X", "6", "7", "8", "X"], true
    include_examples "game_over?", "right to left diagonal contains matching tiles", ["1", "2", "X", "4", "X", "6", "X", "8", "9"], true
    include_examples "game_over?", "there are no matching tiles on the board", ["1", "2", "3", "4", "X", "6", "X", "8", "9"], false
    include_examples "game_over?", "there are no played moves on the board yet", TicTacToeRZ::GameBoard.create_board, false
  end

  shared_examples "win_for_player?" do |description, symbol, board, expected|
    it "returns #{expected} when #{description}" do
      expect(TicTacToeRZ::GameRules::GameOverRules.win_for_player?(symbol, board)).to be expected
    end
  end

  context "method called win_for_player?" do
    it "raises an NilReferenceError when board is nil" do
      expect{ TicTacToeRZ::GameRules::GameOverRules.win_for_player?("X", nil)}.to raise_error(TicTacToeRZ::NilReferenceError)
    end
    
    it "raises an InvalidValueError when player symbol is invalid" do
      expect{ TicTacToeRZ::GameRules::GameOverRules.win_for_player?("1", TicTacToeRZ::GameBoard.create_board)}.to raise_error(TicTacToeRZ::InvalidValueError)
    end

    include_examples "win_for_player?", "first row contains matching tiles", "X", ["X", "X", "X", "X", "4", "5", "6", "7", "8", "9"], true
    include_examples "win_for_player?", "middle row contains matching tiles", "X", ["1", "2", "3", "X", "X", "X", "7", "8", "9"], true
    include_examples "win_for_player?", "last row contains matching tiles", "X", ["1", "2", "3", "4", "5", "6", "X", "X", "X"], true
    include_examples "win_for_player?", "first column contains matching tiles", "X", ["X", "2", "3", "X", "5", "6", "X", "8", "9"], true
    include_examples "win_for_player?", "middle column contains matching tiles", "Y", ["1", "Y", "3", "4", "Y", "6", "7", "Y", "9"], true
    include_examples "win_for_player?", "last column contains matching tiles", "X", ["1", "2", "X", "4", "5", "X", "7", "8", "X"], true
    include_examples "win_for_player?", "left to right diagonal contains matching tiles", "X", ["X", "2", "3", "4", "X", "6", "7", "8", "X"], true
    include_examples "win_for_player?", "right to left diagonal contains matching tiles", "X", ["1", "2", "X", "4", "X", "6", "X", "8", "9"], true
    include_examples "win_for_player?", "there are no matching tiles on the board", "X", ["1", "2", "3", "4", "X", "6", "X", "8", "9"], false
    include_examples "win_for_player?", "there are no played moves on the board yet", "X", TicTacToeRZ::GameBoard.create_board, false
  end
end