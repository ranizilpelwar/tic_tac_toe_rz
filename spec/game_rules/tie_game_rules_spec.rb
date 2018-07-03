require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/tie_game_rules.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'

RSpec.describe "a tie game validator" do
  
  shared_examples "tie_game?" do |description, board, expected|
    it "returns #{expected} when #{description}" do
      expect(TicTacToeRZ::GameRules::TieGameRules.tie_game?(board)).to be expected
    end
  end
  
  context "method called tie_game?" do
    it "raises a NilReferenceError when provided board is nil" do
      expect{TicTacToeRZ::GameRules::TieGameRules.tie_game?(nil)}.to raise_error(TicTacToeRZ::NilReferenceError)
    end

    include_examples "tie_game?", "there are no moves played", TicTacToeRZ::GameBoard.create_board, false
    include_examples "tie_game?", "there are no unoccupied tiles on the board with no win", ["Y", "X", "Y", "X", "X", "Y", "Y", "Y", "X"], true
    include_examples "tie_game?", "there are no unoccupied tiles on the board with someone winning", ["Y", "X", "Y", "Y", "X", "Y", "Y", "Y", "X"], false
    include_examples "tie_game?", "there is an unoccupied tile on board", ["X", "X", "3", "X", "Y", "Y", "Y", "Y", "Y"], false
  end
end