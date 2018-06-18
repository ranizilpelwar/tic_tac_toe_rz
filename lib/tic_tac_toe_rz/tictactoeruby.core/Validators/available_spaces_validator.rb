require_relative '../../tictactoeruby.core/languages/message_generator.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'

module TicTacToeRZ
  module AvailableSpacesValidator

    def self.get_available_spaces(board)
      raise NilReferenceError, "board" if board.nil?
      available_spaces = []
      board.each do |tile_on_board| 
        if digit?(tile_on_board)
          index = board.index(tile_on_board)
          available_spaces.push(index)
        end
      end
      result = available_spaces
    end

    def self.digit?(input)
      pattern = /\A[0-9]+\z/
      match_data = pattern.match(input)
      valid = match_data !=nil
    end
  end
end