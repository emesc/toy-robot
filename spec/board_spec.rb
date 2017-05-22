require 'board'

RSpec.describe Board do

  specify{ expect(Board.width).to eq 5 }

  specify{ expect(Board.height).to eq 5 } 
end
