require 'io/wait'
require 'snake/ui'
require 'snake/board'
require 'snake/commands'

module Snake

  class << self
    attr_reader :board
  end

  def self.setup_board!
    @board = Snake::Board.instance
    @board.box_length = 80
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
        #slither around bitin' fools and hustling apples.
      end
    end
  ensure
    `stty #{term}`
  end

end