require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type_manager.rb'

When(/match option ([1-3]{1}) is selected/) do |number|
  @match_type_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
  @match_type = @match_type_manager.get_match_type(number.to_i)
  @player1 = TicTacToeRZ::Players::Player.new(@player_type, "X")
end

Then(/the second player is a (Human|Computer)/) do |type2|
  @player_type2_expected = type2.to_sym
  @player_type2_actual = @match_type.player2_type.selected_option
  expect(@player_type2_actual).to eq(@player_type2_expected)
end

Then("there are three total match options available") do
  match_manager = TicTacToeRZ::GamePlay::MatchTypeManager.new
  expect(match_manager.get_total_available_matches).to eq(3)
end
