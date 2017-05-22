require 'position'

RSpec.describe Position do
  let(:position) { Position.new(1, 1, 'south') }
  let(:robot) { Robot.new }
  
  it "places the robot on the desired position" do
    expect(robot.x).to eq position.x
    expect(robot.y).to eq position.y
    expect(robot.z).to eq position.z  
  end
end
