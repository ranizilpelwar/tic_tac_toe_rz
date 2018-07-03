require_relative '../validators/player_symbol_validator.rb'
require_relative '../../tictactoeruby.core/languages/message_generator.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../tictactoeruby.core/exceptions/invalid_value_error.rb'

module TicTacToeRZ
  module Players
    class Player
      attr_reader :type, :symbol

      def initialize(type, symbol)
        raise Exceptions::NilReferenceError, "type" if type.nil?
        raise Exceptions::InvalidValueError, "symbol" if !Validators::PlayerSymbolValidator.valid?(symbol) 
        @type = type
        @symbol = symbol
      end

      def equals?(player)
        isEqual = @type == player.type && @symbol == player.symbol
      end
    end
  end
end