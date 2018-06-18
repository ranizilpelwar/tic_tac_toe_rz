require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/gameplay/game_board.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/validators/available_spaces_validator.rb'

RSpec.describe "a Tic Tac Toe board" do
  before(:each) do
    @game = TicTacToeRZ::GameBoard.new(TicTacToeRZ::GameBoard.create_board)
  end

  it "is a grid with nine squares" do
    expect(grid.size).to eq(9)
  end

  it "has a number on each square tile" do
    grid.each do |tile|
      expect(digit?(tile)).to be true
    end
  end

  it "has the player's symbol on a square when a player selects it" do
    index = 4
    symbol = "X"
    select_square(index, symbol)
    grid_value = grid[index]
    expect(grid_value).to eq(symbol)
  end

  it "has the original number on a square when a player reverts it" do
    index = 4
    original_value = "5"
    symbol = "X"
    select_square(index, symbol)
    revert_square(index)
    grid_value = grid[index]
    expect(grid_value).to eq(original_value)
  end
   
  def grid 
    @game.board
  end

  def digit?(input)
    TicTacToeRZ::AvailableSpacesValidator.digit?(input)
  end

  def select_square(index, symbol)
    @game.update_board(index, symbol)
  end

  def revert_square(index)
    @game.revert_board(index)
  end
end