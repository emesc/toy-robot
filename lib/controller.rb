require_relative 'board'
require_relative 'robot'
require_relative 'position'

class Controller

  class Config
    @@commands = ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT']

    def self.commands; @@commands; end
  end

  def initialize
    if loaded?('Board', 'Robot', 'Position')
      puts "5x5 Board and Robot are ready."
    else
      puts "Exiting.\n\n"
      exit!
    end
  end

  def launch!
    introduction
    result = ''
    until result == :quit do
      command, args = read_command
      result = do_command(command, args)
    end
    conclusion
  end

  def read_command
    command = ''
    puts "Commands: " + Controller::Config.commands.join(", ") if command
    print "> "
    user_response = gets.chomp
    args = user_response.downcase.strip.split(" ")
    command = args.shift
    return command, args
  end

  def do_command(command, args=[])
    case command
    when 'place'
      place(args)
    when 'move'
      move
    when 'left'
      left
    when 'right'
      right
    when 'report'
      report
    when 'quit'
      return :quit
    else
      puts "\nI don't understand that command.\n"
    end
  end

  def place(args=[])
    if args.empty?
      puts "Please input valid position and direction (eg, PLACE 1,1,NORTH)"
    else
      x, y, f = split_args(args)
      place_robot(x, y, f)
    end
  end

  def split_args(args)
    args = args[0].split(',')
    x = args.shift.to_i
    y = args.shift.to_i
    f = args[0].to_s
    return x, y, f
  end

  def place_robot(x, y, f)
    @placement = Position.new(x: x, y: y, f: f)
    if valid_position?
      @robot = Robot.new(@placement)
    else
      puts "Placement is out of the board."
    end
  end

  def move
    return robot_not_on_table_info if robot_not_on_table?
    @robot.move
  end

  def left
    return robot_not_on_table_info if robot_not_on_table?
    @robot.left
  end

  def right
    return robot_not_on_table_info if robot_not_on_table?
    @robot.right
  end

  def report
    return robot_not_on_table_info if robot_not_on_table?
    puts "Output #{@robot.x}, #{@robot.y}, #{@robot.f}"
  end

  def loaded?(*files)
    files.all? { |f| Object.const_defined?(f) }
  end

  def introduction
    puts "\n<<< Enter your commands after the prompt >>>\n\n"
  end

  def conclusion
    puts "\n<<< Thank you for using the toy robot simulator >>>\n"
    puts "\n<<< Goodbye! >>>\n\n"
  end

  private

    def robot_not_on_table?
      @robot.nil?
    end

    def robot_not_on_table_info
      puts "Robot not on table.\nPlease input valid position and direction (eg, PLACE 1,1,NORTH)\n\n"
    end

    def valid_position?
      @placement.valid_in_x?(@placement.x) && @placement.valid_in_y?(@placement.y)
    end
end
