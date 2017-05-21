require 'board'

RSpec.describe Board do
  board = Board.new

  specify{ expect(board.width).to eq 5 }

  specify{ expect(board.height).to eq 5 } 
end
