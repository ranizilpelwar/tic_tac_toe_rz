require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'

module TicTacToeRZ
  module GamePlay
    class WeightedMove
      # index: Spot on board where move is made.
      # score: Value of move made on board.
      attr_accessor :index, :score

      def initialize(index, score)
        raise Exceptions::NilReferenceError, "index" if index.nil?
        raise Exceptions::NilReferenceError, "score" if score.nil?
        @index = index
        @score = score
      end
    end
  end
end