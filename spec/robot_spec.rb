require 'robot'
require 'position'

RSpec.describe Robot do
  let(:position) { Position.new(x: 0, y: 0, f: 'north') }
  let(:robot) { Robot.new(position) }

  it "has a position" do
    expect(robot.x).to eq 0
    expect(robot.y).to eq 0
    expect(robot.f).to eq 'north'
  end
end
