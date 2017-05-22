require 'robot'
require 'position'
require 'board'

RSpec.describe Robot do
  let(:position) { Position.new(x: 3, y: 3, f: 'west') }
  let(:robot) { Robot.new(position) }

  context "initial placement" do

    it "has a position" do
      expect(robot.x).to eq position.x
      expect(robot.y).to eq position.y
      expect(robot.f).to eq position.f
    end
  end

  describe "#move" do

    context "within the board" do

      it "should move 1 unit to the west when facing west" do
        expect{ robot.move }.to change{ robot.x }.by -1
        expect{ robot.move }.not_to change{ robot.y }
        expect{ robot.move }.not_to change{ robot.f }
      end

      it "should move 1 unit to the east when facing east" do
        position.f = 'east'
        expect{ robot.move }.to change{ robot.x }.by 1
        expect{ robot.move }.not_to change{ robot.y }
        expect{ robot.move }.not_to change{ robot.f }
      end

      it "should move 1 unit to the north when facing north" do
        position.f = 'north'
        expect{ robot.move }.not_to change{ robot.x }
        expect{ robot.move }.to change{ robot.y }.by 1
        expect{ robot.move }.not_to change{ robot.f }
      end

      it "should move 1 unit to the south when facing south" do
        position.f = 'south'
        expect{ robot.move }.not_to change{ robot.x }
        expect{ robot.move }.to change{ robot. y}.by -1
        expect{ robot.move }.not_to change{ robot.f }
      end
    end

    context "out from the top right corner" do
      let(:position){ Position.new(x: Board.width - 1, y: Board.height - 1, f: 'north') }

      it "should stay in place when moved up" do
        expect{ robot.move }.not_to change{ robot }
      end

      it "should stay in place when moved right" do
        position.f = 'east'
        expect{ robot.move }.not_to change{ robot }
      end
    end

    context "out from the top left corner" do
      let(:position){ Position.new(x: 0, y: Board.height - 1, f: 'north') }

      it "should stay in place when moved up" do
        expect{ robot.move }.not_to change{ robot }
      end

      it "should stay in place when moved left" do
        position.f = 'west'
        expect{ robot.move }.not_to change{ robot }
      end
    end

    context "out from the bottom right corner" do
      let(:position){ Position.new(x: Board.width - 1, y: 0, f: 'south') }

      it "should stay in place when moved down" do
        expect{ robot.move }.not_to change{ robot }
      end

      it "should stay in place when moved right" do
        position.f = 'east'
        expect{ robot.move }.not_to change{ robot }
      end
    end

    context "out from the bottom left corner" do
      let(:position){ Position.new(x: 0, y: 0, f: 'south') }

      it "should stay in place when moved down" do
        expect{ robot.move }.not_to change{ robot }
      end

      it "should stay in place when moved left" do
        position.f = 'west'
        expect{ robot.move }.not_to change{ robot }
      end
    end
  end
end
