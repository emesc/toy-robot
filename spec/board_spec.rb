# require 'lib/board'

RSpec.describe Board do

  specify{ expect(board.width).to eq 5 }

  specify{ expect(board.height).to eq 5 } 
end
