require_relative 'available_spaces_rules.rb'
require_relative 'game_over_rules.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'

module TicTacToeRZ
  module GameRules
    module TieGameRules
      def self.tie_game?(board)
        raise Exceptions::NilReferenceError, "board" if board.nil?
        available_spaces = AvailableSpacesRules.get_available_spaces(board)
        result = available_spaces.length == 0 && !GameOverRules.game_over?(board)
      end
    end
  end
end