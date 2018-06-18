task :run_tests do
  require_relative './test/players/tc_player_type.rb'
  ruby 'test/players/tc_player_manager_initialization.rb'
  ruby 'test/players/tc_player_manager.rb'
  ruby 'test/players/tc_player.rb'
  ruby 'test/players/tc_player_movement_manager.rb'
  ruby 'test/gameplay/tc_match_type.rb'
  ruby 'test/gameplay/tc_match_type_manager.rb'
  ruby 'test/gameplay/tc_game_board.rb'
  ruby 'test/gameplay/tc_computer_actions.rb'
  ruby 'test/validators/tc_available_spaces_validation.rb'
  ruby 'test/validators/tc_game_over_validation.rb'
  ruby 'test/validators/tc_game_play_validation.rb'
  ruby 'test/validators/tc_player_selection_validation.rb'
  ruby 'test/validators/tc_player_symbol_validation.rb'
  ruby 'test/validators/tc_tie_game_validation.rb'
  ruby 'test/evaluators/tc_board_score_evaluation_parameterized_tests.rb'
  ruby 'test/evaluators/tc_board_score_evaluation.rb'
end
