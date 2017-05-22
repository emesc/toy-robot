require 'position'
require 'robot'

RSpec.describe Position do
  let(:position) { Position.new(x: 1, y: 1, f: 'south') }
  let(:robot) { Robot.new(position) }
  
  it "places the robot on the desired position" do   
    expect(robot.x).to eq position.x
    expect(robot.y).to eq position.y
    expect(robot.f).to eq position.f
  end

  it "ensures the position of the robot is within the board dimensions" do
    expect(robot.x).to be_valid_x
    expect(robot.y).to be_valid_y
  end
end
