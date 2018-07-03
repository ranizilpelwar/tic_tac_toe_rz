require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/validators/player_selection_validator.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'

RSpec.describe "a player selection validator" do
  shared_examples "match symbol entries" do |description, input, player_symbol_one, player_symbol_two, expected|
    it "returns #{expected} for #{description}" do
      return_value = TicTacToeRZ::Validators::PlayerSelectionValidator.valid?(input, player_symbol_one, player_symbol_two)
      expect(return_value).to be expected
    end
  end

  context "method called valid?" do
    include_examples "match symbol entries", "a space character", " ", "A", "B", false
    include_examples "match symbol entries", "a digit", "1", "A", "B", false
    include_examples "match symbol entries", "a lowercase value for player 1", "a", "A", "B", true
    include_examples "match symbol entries", "a lowercase value for player 2", "b", "A", "B", true
  
    it "raises a NilReferenceError when input is nil" do
      expect{ TicTacToeRZ::Validators::PlayerSelectionValidator.valid?(nil, "X", "Y") }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "raises a NilReferenceError when player_symbol_one is nil" do
      expect{ TicTacToeRZ::Validators::PlayerSelectionValidator.valid?("input", nil, "X") }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "raises a NilReferenceError when player_symbol_two is nil" do
      expect{ TicTacToeRZ::Validators::PlayerSelectionValidator.valid?("input", "X", nil) }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "raises a InvalidValueError when input is an empty string" do
      expect{ TicTacToeRZ::Validators::PlayerSelectionValidator.valid?("", "X", "Y") }.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "raises a InvalidValueError when player_symbol_one is an empty string" do
      expect{ TicTacToeRZ::Validators::PlayerSelectionValidator.valid?("input", "", "X") }.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "raises an InvalidValueError when player_symbol_two is an empty string" do
      expect{ TicTacToeRZ::Validators::PlayerSelectionValidator.valid?("input", "X", "") }.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end
  end
end