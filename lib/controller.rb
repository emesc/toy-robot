require_relative 'board'
require_relative 'robot'
require_relative 'position'

class Controller

  class Config
    @@commands   = ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT', 'QUIT']
    @@directions = ['NORTH', 'SOUTH', 'EAST', 'WEST']

    def self.commands; @@commands; end
    def self.directions; @@directions; end
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
      puts "I don't understand that command."
    end
  end

  def place(args=[])
    args = args[0].split(',') if args[0]
    if args.empty? || args.length != 3
      ask_for_valid_input      
    else
      x, y, f = assign_args(args)
      place_robot(x, y, f)
    end
  end

  def assign_args(args)
    x = args.shift.to_i
    y = args.shift.to_i
    f = args[0].to_s.downcase
    return x, y, f if Controller::Config.directions.include? f.upcase
    ask_for_valid_input
  end

  def place_robot(x, y, f)
    @placement = Position.new(x: x, y: y, f: f)
    if valid_position?
      @robot = Robot.new(@placement)
    else
      puts "Placement is not on the board."
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
      puts "Robot not on table."
    end

    def ask_for_valid_input
      puts "Please input valid position and direction (eg, PLACE 1,1,NORTH)."
    end

    def valid_position?
      @placement.valid_in_x?(@placement.x) && @placement.valid_in_y?(@placement.y)
    end
end
