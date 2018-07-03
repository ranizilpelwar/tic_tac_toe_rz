require_relative '../../tictactoeruby.core/languages/message_generator.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../tictactoeruby.core/exceptions/invalid_value_error.rb'

module TicTacToeRZ
  module Validators
    module PlayerSelectionValidator
      def self.valid?(input, player_symbol_one, player_symbol_two)
        raise Exceptions::NilReferenceError, "input" if input.nil?
        raise Exceptions::NilReferenceError, "player_symbol_one" if player_symbol_one.nil?
        raise Exceptions::NilReferenceError, "player_symbol_two" if player_symbol_two.nil?
        raise Exceptions::InvalidValueError, "input" if input == ""
        raise Exceptions::InvalidValueError, "player_symbol_one" if player_symbol_one == ""
        raise Exceptions::InvalidValueError, "player_symbol_two" if player_symbol_two == ""
        input_upcase = input.upcase
        valid = input_upcase == player_symbol_one.upcase || input_upcase == player_symbol_two.upcase
      end
    end
  end
end