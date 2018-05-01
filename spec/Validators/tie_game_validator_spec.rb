require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/Validators/tie_game_validator.rb'
require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'

RSpec.describe "a tie game validator" do
  
  shared_examples "tie_game?" do |description, board, expected|
    it "returns #{expected} when #{description}" do
      expect(TicTacToeRZ::TieGameValidator.tie_game?(board)).to be expected
    end
  end
  
  context "method called tie_game?" do
    it "raises a NilReferenceError when provided board is nil" do
      expect{TicTacToeRZ::TieGameValidator.tie_game?(nil)}.to raise_error(TicTacToeRZ::NilReferenceError)
    end

    include_examples "tie_game?", "there are no moves played", TicTacToeRZ::GameBoard.create_board, false
    include_examples "tie_game?", "there are no unoccupied tiles on the board with no win", ["Y", "X", "Y", "X", "X", "Y", "Y", "Y", "X"], true
    include_examples "tie_game?", "there are no unoccupied tiles on the board with someone winning", ["Y", "X", "Y", "Y", "X", "Y", "Y", "Y", "X"], false
    include_examples "tie_game?", "there is an unoccupied tile on board", ["X", "X", "3", "X", "Y", "Y", "Y", "Y", "Y"], false
  end
end