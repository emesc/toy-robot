require 'robot'
require 'position'

RSpec.describe Robot do

  let(:position) { Position.new(x: 0, y: 0, f: 'north') }
  let(:robot) { Robot.new(position) }

  context "initial placement" do

    it "has a position" do
      expect(robot.x).to eq position.x
      expect(robot.y).to eq position.y
      expect(robot.f).to eq position.f
    end
  end
end
