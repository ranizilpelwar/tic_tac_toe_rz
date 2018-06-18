require_relative '../validators/player_symbol_validator.rb'
require_relative '../../tictactoeruby.core/languages/message_generator.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../tictactoeruby.core/exceptions/invalid_value_error.rb'

module TicTacToeRZ
  class Player
    attr_reader :type, :symbol

    def initialize(type, symbol)
      raise NilReferenceError, "type" if type.nil?
      raise InvalidValueError, "symbol" if !PlayerSymbolValidator.valid?(symbol) 
      @type = type
      @symbol = symbol
    end

    def equals?(player)
      isEqual = @type == player.type && @symbol == player.symbol
    end
  end
end