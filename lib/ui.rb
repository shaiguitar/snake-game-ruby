module Snake
  class UI
    
    attr_accessor :current_head, :current_direction
    
    def initialize(x,y)
      @current_direction = Snake::Commands::RIGHT
      @x = x
      @y = y
    end

    def current_head
      @current_head = [@x, @y]
    end

    def move(direction)
      @current_direction = direction
      case direction
      when Snake::Commands::UP
        @y = @y - 1
      when Snake::Commands::DOWN
        @y = @y + 1
      when Snake::Commands::LEFT
        @x = @x - 1
      when Snake::Commands::RIGHT
        @x = @x + 1
      else
        raise RuntimeError, "unknown direction #{direction}?"
      end
      Snake.board.register_drawing
    end
    
  end
end