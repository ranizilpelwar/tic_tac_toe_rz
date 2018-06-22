require_relative '../../tictactoeruby.core/languages/message_generator.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'

module TicTacToeRZ
  module GameRules
    module AvailableSpacesRules

      def self.get_available_spaces(board)
        raise NilReferenceError, "board" if board.nil?
        available_spaces = []
        board.select do |tile_on_board| 
          digit?(tile_on_board)
        end.each do |tile_on_board|
          available_spaces.push(board.index(tile_on_board))
        end
        available_spaces
      end

      def self.digit?(input)
        pattern = /\A[0-9]+\z/
        match_data = pattern.match(input)
        valid = match_data !=nil
      end
    end
  end
end