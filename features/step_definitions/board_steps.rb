require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/game_rules/game_play_rules.rb'
require_relative '../../test/players/mock_player_manager.rb'

	When("the board is displayed") do
		@game_board = TicTacToeRZ::GamePlay::GameBoard.new(TicTacToeRZ::GamePlay::GameBoard.create_board)
	end

	Then("the board should have {int} total squares") do |int|
		expect(@game_board.board.size).to eq(int)
	end

	Then("square {int} displays the number {int}") do |square, value|
		expect(@game_board.board[square.to_i - 1]).to eq(value.to_s)
	end

	Given("square {int} on the board is unoccupied") do |int|
		@game_board.revert_board(int - 1)
	end

	When("player with symbol {string} selects square {int}") do |string, int|
		@evaluated_result = TicTacToeRZ::GameRules::GamePlayRules.evaluate_move(@game_board, int.to_s)	
	end

	Then("square {int} can be updated to display the symbol {string}") do |int, string|
		expect(@evaluated_result.is_valid_move).to eq(true)		
	end

	Given("square {int} on the board is occupied by a player with a symbol of {string}") do |int, string|
		index = int.to_i - 1
	  @game_board.update_board(index, string)	
	end

	Then("the system indicates that the given square cannot be selected") do
		expect(@evaluated_result.is_valid_move).to eq(false)	
	end

