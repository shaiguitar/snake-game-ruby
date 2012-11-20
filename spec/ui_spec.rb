require 'spec_helper'

describe Snake::UI do
  before(:all) do
    @ui = Snake::UI.new(25,25)
    Snake.setup_board!
  end
  it 'starts where you tell it to, going right' do
    @ui.current_head.should eq [25,25]
    @ui.current_direction.should eq Snake::Commands::RIGHT
  end

  describe 'moving' do
    it 'changes the current_direction accordingly' do
      @ui.move(Snake::Commands::UP)
      @ui.current_direction.should eq Snake::Commands::UP
      @ui.move(Snake::Commands::DOWN)
    end
    
    it 'updates the current_head for each direction' do
      @ui.move(Snake::Commands::UP)
      @ui.current_head.should eq [25,24]
      @ui.move(Snake::Commands::LEFT)
      @ui.current_head.should eq [24,24]
      @ui.move(Snake::Commands::DOWN)
      @ui.current_head.should eq [24,25]
      @ui.move(Snake::Commands::RIGHT)
      @ui.current_head.should eq [25,25]
    end
    
    it 'updates the board' do
      output1 = Snake.board.draw!
      @ui.move(Snake::Commands::DOWN)
      @ui.move(Snake::Commands::LEFT)
      output2 = Snake.board.draw!
      output1.should_not eq output2
    end
  end
  
end