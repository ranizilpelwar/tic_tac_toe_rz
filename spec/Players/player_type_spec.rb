require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'

RSpec.describe "a player type" do
  context "initialization" do
    it "raises a InvalidValueError when created as a robot" do
      expect{TicTacToeRZ::Players::PlayerType.new(:Robot)}.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end
  end

  context "method called valid?" do
    it "returns true when a Human is entered as a parameter" do
      expect(TicTacToeRZ::Players::PlayerType.valid?(:Human)).to be true
    end

    it "returns true when a Computer is entered as a parameter" do
      expect(TicTacToeRZ::Players::PlayerType.valid?(:Computer)).to be true
    end

    it "returns false when a Robot is entered as a parameter" do
      expect(TicTacToeRZ::Players::PlayerType.valid?(:Robot)).to be false
    end
  end
end