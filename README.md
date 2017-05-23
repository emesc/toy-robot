# Toy Robot Simulator
A solution to the TDD practice problem from Rails Girls Next Melbourne 20 May 2017

## Reference

- https://codereview.stackexchange.com/questions/96181/robot-toy-simulator

## Run the tests with rspec

For individual test:
```
  $ rspec spec/robot.rb
```

To run all tests:
```
  $ rspec
```

## Run the game
```
  $ ruby lib/init.rb
```

There are prompts to guide you all the way. Quit to exit.
Commands can be entered as stated on the reference.


a)

    PLACE 0,0,NORTH
    MOVE
    REPORT
    Output: 0,1,NORTH

b)

    PLACE 0,0,NORTH
    LEFT
    REPORT
    Output: 0,0,WEST

c)

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT
    Output: 3,3,NORTH
