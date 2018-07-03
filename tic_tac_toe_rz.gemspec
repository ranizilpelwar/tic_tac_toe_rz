Gem::Specification.new do |s|
  s.name        = 'tic_tac_toe_rz'
  s.version     = '1.2.00'
  s.date        = '2018-06-07'
  s.summary     = "Tic Tac Toe API"
  s.description = "Tic Tac Toe API written in Ruby"
  s.authors     = ["Rani Zilpelwar"]
  s.email       = 'rani@8thlight.com'
  s.files       = ["lib/tic_tac_toe_rz.rb", 
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/config/application_text.en.yaml", 
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/config/application_text.es.yaml", 
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/config/global_settings.yaml",
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/config/language_options.en.yaml", 
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/config/language_options.es.yaml",
    "lib/tic_tac_toe_rz/tictactoeruby.core/evaluators/board_score_evaluator.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/evaluators/player_symbol_evaluator.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/player_type_error.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/game_rule_violation_error.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/computer_actions.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type_manager.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/weighted_move.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/language_config.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/language_options_adapter.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/language.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/message_generator.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/yaml_reader.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/languages/yaml_writer.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/players/player_manager.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/players/player_movement_manager.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/players/player_type.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/players/player.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/available_spaces_rules.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/game_over_rules.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/game_play_rules.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/validators/input_validator.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/validators/player_selection_validator.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/validators/player_symbol_validator.rb",
    "lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/tie_game_rules.rb",
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
		"features/step_definitions/players_steps.rb",
	  "features/test_files/bad_global_settings/global_settings.yaml",
	  "features/test_files/bad_global_settings/language_options.en.yaml",
	  "features/test_files/default_language_english/global_settings.yaml",
	  "features/test_files/default_language_english/language_options.en.yaml",
	  "features/test_files/default_language_english/language_options.es.yaml",
	  "features/test_files/default_language_spanish/global_settings.yaml",
	  "features/test_files/default_language_spanish/language_options.en.yaml",
	  "features/test_files/default_language_spanish/language_options.es.yaml",
	  "spec/evaluators/board_score_evaluator_spec.rb",
	  "spec/gameplay/board_spec.rb",
	  "spec/gameplay/computer_actions_spec.rb",
	  "spec/gameplay/doubles.rb",
	  "spec/gameplay/game_board_spec.rb",
	  "spec/gameplay/game_spec.rb",
	  "spec/gameplay/match_spec.rb",
	  "spec/gameplay/match_type_manager_spec.rb",
	  "spec/languages/language_options_adapter_spec.rb",
	  "spec/languages/yaml_reader_spec.rb",
	  "spec/languages/yaml_writer_spec.rb",
	  "spec/players/player_manager_spec.rb",
	  "spec/players/player_movement_manager_spec.rb",
	  "spec/players/player_spec.rb",
	  "spec/players/player_type_spec.rb",
	  "spec/testfiles/testing.en.yaml",
	  "spec/game_rules/available_spaces_rules_spec.rb",
	  "spec/game_rules/game_over_rules_spec.rb",
	  "spec/game_rules/game_play_rules_spec.rb",
	  "spec/validators/player_selection_validator_spec.rb",
	  "spec/validators/player_symbol_validator_spec.rb",
	  "spec/game_rules/tie_game_rules_spec.rb",
	  "test/evaluators/tc_board_score_evaluation.rb",
	  "test/evaluators/tc_board_score_evaluation_parameterized_tests.rb",
	  "test/gameplay/tc_computer_actions.rb",
	  "test/gameplay/tc_game_board.rb",
	  "test/gameplay/tc_match_type.rb",
	  "test/gameplay/tc_match_type_manager.rb",
		"test/players/mock_player_manager.rb",
		"test/players/tc_player.rb",
  	"test/players/tc_player_manager.rb",
		"test/players/tc_player_manager_initialization.rb",
		"test/players/tc_player_movement_manager.rb",
		"test/players/tc_player_type.rb",
		"test/game_rules/tc_available_spaces_rules.rb",
		"test/game_rules/tc_game_over_rules.rb",
		"test/game_rules/tc_game_play_rules.rb",
		"test/validators/tc_player_selection_validation.rb",
		"test/validators/tc_player_symbol_validation.rb",
		"test/game_rules/tc_tie_game_rules.rb"]
  s.homepage    =
    'http://rubygems.org'
  s.license       = 'MIT'
end
