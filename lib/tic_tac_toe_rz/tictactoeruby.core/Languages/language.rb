require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'

module TicTacToeRZ
  module Languages
    class Language
      
      attr_accessor :tag

      def initialize(tag)
        raise Exceptions::NilReferenceError, "tag" if tag.nil?
        raise Exceptions::ArgumentError, "tag" if tag == ""
        @tag = tag
      end
    end
  end
end