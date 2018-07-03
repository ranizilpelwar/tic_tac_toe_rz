require_relative '../validators/player_symbol_validator.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../tictactoeruby.core/exceptions/invalid_value_error.rb'

module TicTacToeRZ
  module GamePlay
    class GameBoard
      attr_reader :board

      def initialize(board)
        raise Exceptions::NilReferenceError, "board" if board.nil?
        raise Exceptions::InvalidValueError, "board" if board.size == 0
        @board = board
      end

      def self.create_board
        board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      end

      def update_board(index, player_symbol)
        raise Exceptions::InvalidValueError, "player_symbol" if !Validators::PlayerSymbolValidator.valid?(player_symbol)
        raise Exceptions::InvalidValueError, "index" if index >= board.length || index < 0
        @board[index] = player_symbol
      end

      def revert_board(index)
        raise Exceptions::InvalidValueError, "index" if index >= board.length || index < 0 
        tile = index + 1
        @board[index] = tile.to_s
      end

      def tile(index)
        raise Exceptions::InvalidValueError, "index" if index >= board.length || index < 0
        board[index]
      end
    end
  end
end