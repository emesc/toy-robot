require 'robot'

RSpec.describe Robot do
  robot = Robot.new

  it "should start from the origin" do
    expect(robot.position.x).to eq 0
    expect(robot.position.y).to eq 0
  end

  it "should start facing north" do
    expect(robot.position.f).to eq 'north'
  end
end