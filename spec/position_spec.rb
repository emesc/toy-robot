require 'position'
require 'robot'

RSpec.describe Position do
  let(:position) { Position.new(x: 1, y: 1, f: 'south') }
  
  it "places the robot on the desired position" do
    robot = Robot.new(position)
    expect(robot.x).to eq position.x
    expect(robot.y).to eq position.y
    expect(robot.f).to eq position.f
  end
end
