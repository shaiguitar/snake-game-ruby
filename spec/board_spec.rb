require 'spec_helper'

describe Snake::Board do
  before do
    @board = Snake::Board.instance
    @board.box_length = 50
    @board.box_width = 50
  end

  pending "make sure snakes are within the border, else raises"
  
  it 'holds snakes' do
    @board.snakes = [ Snake::UI.new(25,25), Snake::UI.new(42,42) ]
  end

  it 'knows its borders' do
    @board.box_length.should eq 50
    @board.box_width.should eq 50
  end

  it 'has a representation of the board in a hash of x,y coordinates' do
    @board.register_drawing
    @board.drawing[[4,0]].should == '.'
    @board.drawing[[0,34]].should == '.'
    @board.drawing[[49,49]].should == '.'
    @board.drawing[[34,7]].should == ' '
  end

  describe 'drawing' do
    
    before do
      @board = Snake::Board.instance
      @board.box_length = 5
      @board.box_width = 5
      @board.snakes = [ Snake::UI.new(2,3) ]
      @board.register_drawing
    end

    # it 'bla' do
    #   @board.draw!
    # end

    it 'can draw the representation of the board' do
      str = @board.draw!
      str.read.should eq ".....\n.   .\n.   .\n. ~ .\n.....\n"
    end
    
  end

end

