require_relative 'match_type.rb'
require_relative '../players/player_type.rb'
require_relative '../../tictactoeruby.core/languages/message_generator.rb'
require_relative '../../tictactoeruby.core/exceptions/invalid_value_error.rb'

module TicTacToeRZ
  module GamePlay
    class MatchTypeManager
      attr_reader :matches

      def initialize
        # define player types
        player_type_human = Players::PlayerType.new(:Human)
        player_type_computer = Players::PlayerType.new(:Computer)

        # define match types
        match1_human_vs_human = GamePlay::MatchType.new(player_type_human, player_type_human)
        match2_human_vs_computer = GamePlay::MatchType.new(player_type_human, player_type_computer)
        match3_computer_vs_computer = GamePlay::MatchType.new(player_type_computer, player_type_computer)

        # add match types to manager
        @matches = []
        @matches << match1_human_vs_human
        @matches << match2_human_vs_computer
        @matches << match3_computer_vs_computer
      end

      def get_total_available_matches
        total = @matches.length
      end

      # match_number: The number of the match, where 1 represents the first match displayed in the game (Human vs Human).
      def get_match_type(match_number)
        raise Exceptions::InvalidValueError, "match_number" if !valid?(match_number)
        index = match_number - 1
        match_type = @matches[index]
      end

      def valid?(match_number)
        max_match_number = get_total_available_matches
        valid = match_number >= 1 && match_number <= max_match_number
      end

      def get_match_numbers
        array = []
        number = 1
        total = get_total_available_matches
        total.times do 
          array << number
          number = number + 1
        end
        result = array
      end

      def input_choices
        choices = get_match_numbers.map(&:to_s)
      end

      def player_type(match_number, player_number)
        match_type = get_match_type(match_number)
        case player_number
          when 1
            match_type.player1_type.selected_option.to_s
          when 2
            match_type.player2_type.selected_option.to_s
          else
            raise Exceptions::InvalidValueError
          end
      end
    end
  end
end