require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/validators/player_symbol_validator.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'

RSpec.describe "a player symbol validator" do
  shared_examples "valid symbol" do |description, input, expected|
    it "returns #{expected} for #{description}" do
      expect(TicTacToeRZ::PlayerSymbolValidator.valid?(input)).to be expected
    end
  end

  context "method called valid?" do
    include_examples "valid symbol", "a single digit", "1", false
    include_examples "valid symbol", "a dual digit", "11", false
    include_examples "valid symbol", "an input with length greater than 1", "XX", false
    include_examples "valid symbol", "an upper case alpha character", "A", true
    include_examples "valid symbol", "a lower case alpha character", "a", true
    include_examples "valid symbol", "a percent character", "%", true
    include_examples "valid symbol", "a pound character", "#", true
    include_examples "valid symbol", "a space character", " ", false
  
    it "raises a NilReferenceError when input is nil" do
      expect{ TicTacToeRZ::PlayerSymbolValidator.valid?(nil) }.to raise_error(TicTacToeRZ::NilReferenceError)
    end

    it "raises an InvalidValueError when input is an empty string" do
      expect{ TicTacToeRZ::PlayerSymbolValidator.valid?("") }.to raise_error(TicTacToeRZ::InvalidValueError)
    end
  end
end