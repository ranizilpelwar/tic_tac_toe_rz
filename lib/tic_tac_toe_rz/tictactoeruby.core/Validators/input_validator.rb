module TicTacToeRZ
  module Validators
    module InputValidator
      def self.valid?
        return lambda { |input, valid_choices| valid = valid_choices.include?(input) }
      end
    end
  end
end