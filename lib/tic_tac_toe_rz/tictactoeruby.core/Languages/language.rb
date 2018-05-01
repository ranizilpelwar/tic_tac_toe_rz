require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'

module TicTacToeRZ
  class Language

    attr_accessor :tag

    def initialize(tag)
      raise NilReferenceError, "tag" if tag.nil?
      raise ArgumentError, "tag" if tag == ""
      @tag = tag
    end
  end
end