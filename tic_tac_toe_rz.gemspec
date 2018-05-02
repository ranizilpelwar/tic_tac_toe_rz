Gem::Specification.new do |s|
  s.name        = 'tic_tac_toe_rz'
  s.version     = '0.0.14'
  s.date        = '2018-04-25'
  s.summary     = "Tic Tac Toe API"
  s.description = "Tic Tac Toe API written in Ruby"
  s.authors     = ["Rani Zilpelwar"]
  s.email       = 'rani@8thlight.com'
  s.files       = ["lib/tic_tac_toe_rz.rb", 
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Config/application_text.en.yaml", 
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Config/application_text.es.yaml", 
    "lib/tic_tac_toe_rz/tictactoeruby.core/config/global_settings.yaml",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Config/language_options.en.yaml", 
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Config/language_options.es.yaml",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Evaluators/board_score_evaluator.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Evaluators/player_symbol_evaluator.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Exceptions/invalid_value_error.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Exceptions/nil_reference_error.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Exceptions/player_type_error.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/GamePlay/computer_actions.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/GamePlay/game_board.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/GamePlay/match_type_manager.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/GamePlay/match_type.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/GamePlay/weighted_move.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Languages/language_config.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Languages/language_options_adapter.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Languages/language.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Languages/message_generator.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Languages/yaml_reader.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Languages/yaml_writer.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Players/player_manager.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Players/player_movement_manager.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Players/player_type.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Players/player.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Validators/available_spaces_validator.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Validators/game_over_validator.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Validators/game_play_validator.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Validators/input_validator.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Validators/player_selection_validator.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Validators/player_symbol_validator.rb",
    "lib/tic_tac_toe_rz/TicTacToeRuby.Core/Validators/tie_game_validator.rb",
	  "features/board.feature",
		"features/computer_actions.feature",
		"features/game_over.feature",
		"features/language_options.feature",
		"features/match.feature",
		"features/step_definitions/board_steps.rb",
		"features/step_definitions/computer_actions_steps.rb",
		"features/step_definitions/game_over_steps.rb",
		"features/step_definitions/language_options_steps.rb",
		"features/step_definitions/match_steps.rb",
		"features/step_definitions/players_steps.rb"]
  s.homepage    =
    'http://rubygems.org'
  s.license       = 'MIT'
end
