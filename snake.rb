require 'io/wait'
require './lib/ui'
require './lib/board'
require './lib/commands'

module Snake

  class << self
    attr_reader :board
  end

  def self.setup_board!
    @board = Snake::Board.instance
    @board.box_length = 50
    @board.box_width = 50
  end
  
  def self.run(snake)
    term = `stty -g`
    `stty raw -echo cbreak`
    loop do
      `clear`
      @board.draw!
      if STDIN.ready?
        #command thy snake!
        command = STDIN.getc
      end
      if command
        snake.move(command)
      else
        snake.move(snake.current_direction)
      end
      sleep 0.2
    end
  ensure
    `stty #{term}`
  end

end