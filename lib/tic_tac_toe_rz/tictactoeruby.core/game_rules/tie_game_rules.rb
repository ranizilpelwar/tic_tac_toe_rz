require_relative 'available_spaces_rules.rb'
require_relative 'game_over_validator.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'

module TicTacToeRZ
  module TieGameValidator
    def self.tie_game?(board)
      raise NilReferenceError, "board" if board.nil?
      available_spaces = AvailableSpacesRules.get_available_spaces(board)
      result = available_spaces.length == 0 && !GameOverValidator.game_over?(board)
    end
  end
end