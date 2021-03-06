require_relative '../../tictactoeruby.core/languages/message_generator.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../tictactoeruby.core/exceptions/invalid_value_error.rb'

module TicTacToeRZ
  module Validators
    module PlayerSymbolValidator

      SYMBOL_PATTERN = /\A[^0-9\s]{1}\z/

      def self.valid?(input)
        validate_by.(input, SYMBOL_PATTERN)
      end

      def self.validate_by
        return lambda do |input, valid_choices_regex_pattern|
          raise Exceptions::NilReferenceError if input.nil?
          raise Exceptions::InvalidValueError if input == ""
          match_data = valid_choices_regex_pattern.match(input)
          match_data != nil
        end
      end
    end
  end
end
