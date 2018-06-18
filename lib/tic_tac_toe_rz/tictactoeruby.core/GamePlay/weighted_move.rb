require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'

module TicTacToeRZ
  class WeightedMove
    # index: Spot on board where move is made.
    # score: Value of move made on board.
    attr_accessor :index, :score

    def initialize(index, score)
      raise NilReferenceError, "index" if index.nil?
      raise NilReferenceError, "score" if score.nil?
      @index = index
      @score = score
    end
  end
end