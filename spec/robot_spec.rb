require 'robot'

RSpec.describe Robot do
  robot = Robot.new

  it "should start from the origin" do
    expect(robot.x).to eq 0
    expect(robot.y).to eq 0
  end

  it "should start facing north" do
    expect(robot.f).to eq 'north'
  end
end