require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/match_type_manager.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/validators/game_over_validator.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/validators/tie_game_validator.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/validators/player_selection_validator.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/players/player_movement_manager.rb'
require_relative './doubles.rb'

RSpec.configure do |config|
  config.include Doubles
end

RSpec.describe "a game" do 

  it "has three matches available to play" do
    expect(match_manager.get_total_available_matches).to eq(3)
  end

  it "allows the user to chose from three types of matches" do
    match_type_manager = TicTacToeRZ::MatchTypeManager.new
    expect(match_type_manager.get_total_available_matches).to eq(3)
  end

  it "is against two players" do
    player1 = double()
    player2 = double()
    match = match_type_double(player1, player2)
    expect(match.player1_type).to_not be_nil
    expect(match.player2_type).to_not be_nil
  end

  it "allows the user to choose which player goes first" do
    symbol1 = "X"
    symbol2 = "Y"
    selection = "X"
    expect(TicTacToeRZ::PlayerSelectionValidator.valid?(selection, symbol1, symbol2)).to be true
  end

  it "can end in a win when a player has three squares in a row" do
    board = ["X", "X", "X", "4", "5", "6", "7", "8", "9"]
    expect(TicTacToeRZ::GameOverValidator.game_over?(board)).to be true
  end

  it "can end in a win when a player has three squares in a column" do
    board = ["X", "2", "3", "X", "5", "6", "X", "8", "9"]
    expect(TicTacToeRZ::GameOverValidator.game_over?(board)).to be true
  end

  it "can end in a win when a player has three squares diagonally" do
    board1 = ["X", "2", "3", "4", "X", "6", "7", "8", "X"]
    win_left_diagonal = TicTacToeRZ::GameOverValidator.game_over?(board1)
    board2 = ["1", "2", "X", "4", "X", "6", "X", "8", "9"]
    win_right_diagonal = TicTacToeRZ::GameOverValidator.game_over?(board2)
    expect(win_left_diagonal).to be true
    expect(win_right_diagonal).to be true
  end 

  it "can end in a tie when neither player gets three squares consecutively on a board" do
    board = ["X", "X", "Y", "Y", "Y", "X", "X", "X", "Y"]
    expect(TicTacToeRZ::TieGameValidator.tie_game?(board)).to be true
  end

  it "can store a player's last move" do
    match_type = 1
    player_number = 1
    updated_move = 4
    manager = movement_manager(match_type)
    stored_value = manager.update_last_move_for_player(player_number, updated_move)
    expect(manager.get_last_move_for_player(player_number)).to eq(updated_move)
  end
 
  def match_manager
    TicTacToeRZ::MatchTypeManager.new
  end

  def movement_manager(match_type)
    TicTacToeRZ::PlayerMovementManager.new(match_type)
  end
end