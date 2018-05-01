require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../lib/tic_tac_toe_rz/TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

RSpec.describe "a player type" do
  context "initialization" do
    it "raises a InvalidValueError when created as a robot" do
      expect{TicTacToeRZ::PlayerType.new(:Robot)}.to raise_error(TicTacToeRZ::InvalidValueError)
    end
  end

  context "method called valid?" do
    it "returns true when a Human is entered as a parameter" do
      expect(TicTacToeRZ::PlayerType.valid?(:Human)).to be true
    end

    it "returns true when a Computer is entered as a parameter" do
      expect(TicTacToeRZ::PlayerType.valid?(:Computer)).to be true
    end

    it "returns false when a Robot is entered as a parameter" do
      expect(TicTacToeRZ::PlayerType.valid?(:Robot)).to be false
    end
  end
end