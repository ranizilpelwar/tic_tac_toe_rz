require_relative '../exceptions/invalid_value_error.rb'

module TicTacToeRZ
  module Players
    class PlayerType
      
      OPTIONS = [:Human, :Computer]

      attr_reader :selected_option

      def self.valid?(type)
        OPTIONS.include?(type)
      end

      def initialize(type)
        raise Exceptions::InvalidValueError, "type = #{type}" if !PlayerType.valid?(type)
        @selected_option = type
      end
    end
  end
end

