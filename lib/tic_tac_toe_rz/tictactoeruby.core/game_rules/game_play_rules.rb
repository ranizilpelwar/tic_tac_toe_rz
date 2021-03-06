require_relative '../gameplay/game_board.rb'
require_relative '../../tictactoeruby.core/game_rules/available_spaces_rules.rb'
require_relative '../../tictactoeruby.core/game_rules/game_over_rules.rb'
require_relative '../../tictactoeruby.core/validators/player_symbol_validator.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../tictactoeruby.core/exceptions/invalid_value_error.rb'

module TicTacToeRZ
  module GameRules
    module GamePlayRules
      # Returns an array containing two elements:
      # 1) is_valid: True if the tile chosen on the board is a valid move that can be made in the game and false otherwise, and
      # 2) index_of_board: index on the board on which a move should be made. It is provided if is_valid is true. It is -1 otherwise.
      def self.evaluate_move(game_board, tile_on_board)
        raise Exceptions::NilReferenceError, "game_board" if game_board.nil?
        is_valid_move = false
        index_of_board = -1
        is_digit = AvailableSpacesRules.digit?(tile_on_board)
        if is_digit
          board = game_board.board
          index_of_board = board.index(tile_on_board)
          is_valid_move = true if !index_of_board.nil?
        end
        result = generate_result(is_valid_move, index_of_board)
      end

      def self.generate_result(is_valid_move, index_of_board)
        result = Struct.new(:is_valid_move, :index_of_board).new(is_valid_move, index_of_board)
      end

      def self.winning_game?(player_symbol, board, available_spaces)
        raise Exceptions::NilReferenceError, "board" if board.nil?
        raise Exceptions::NilReferenceError, "available_spaces" if available_spaces.nil?
        raise Exceptions::InvalidValueError, "player_symbol" if !Validators::PlayerSymbolValidator.valid?(player_symbol)

        found_best_move = false
        winning_spot = -1
        temp_board = board.each {  }

        available_spaces.each do |current_spot| 
          temp_board[current_spot] = player_symbol
          if GameOverRules.game_over?(temp_board)
            found_best_move = true
            winning_spot = current_spot
          else
            temp_board[current_spot] = current_spot.to_s
          end     
        end
        result = generate_result(found_best_move, winning_spot)
      end
    end
  end
end