require 'test_helper'
require 'minitest/spec'
require 'digest/md5'

class ConnectFourTest < ConnectFourSpec
 
  describe "Instructions" do
    
    def setup
      @ins = Instructions.new
    end
    
    it "responds to 'load'" do
      @ins.must_respond_to :load
    end
    
    it "tells you how to play" do
      @ins.load.must_include "by '1'"
      @ins.load.must_include "by '2'"
      @ins.load.must_include "wait for the prompt"
      @ins.load.must_include "select a row"
      @ins.load.must_include "press 'ENTER'"
      @ins.load.must_include "Please note"
      @ins.load.must_include "ENTER to continue"
    end
    
  end

  describe 'Game' do
    
    def setup
      @game = Game.new
      @new_array = @game.new_array
      @player = 1
      @new_grid = @game.create_grid(@new_array, @player)
    end  
      
    # Initialize #
      
    describe "initialization" do
      
      it "responds to 'name'" do
        @game.must_respond_to :name
      end

      it "has a name" do
        @game.name.must_include "Connect Four"
      end

      it "responds to 'column_numbers'" do
        @game.must_respond_to :column_numbers
      end

      it "has numbered columns" do
        @game.column_numbers.must_include %w[1 2 3 4 5 6 7 8].sample
      end

      it "responds to 'gameboard_head'" do
        @game.must_respond_to :gameboard_head
      end

      it "responds to 'create_grid'" do
        @game.must_respond_to :create_grid
      end

      it "has 64 game spaces in an 8x8 grid" do
        Digest::MD5.hexdigest(@new_grid.inspect).must_equal "e07a21fe38428ede3e99d9b0efc8eb41"
      end

      it "responds to 'start'" do
        @game.must_respond_to :start
      end

      it "responds to 'get_players" do
        @game.must_respond_to :get_players
      end
      
    end
    
    # Run #
    
    describe "runtime" do
      
      it "responds to 'new_array'" do
        @game.must_respond_to :new_array
      end

      it "responds to 'check_valid'" do
        @game.must_respond_to :check_valid
      end

      it "[check_valid] returns 23 if invalid" do
        @game.check_valid(99).must_equal 23
      end

      it "responds to 'get_drop_location'" do
        @game.must_respond_to :get_drop_location
      end

      it "responds to 'put_player_token'" do
        @game.must_respond_to :put_player_token
      end

      #flag make this work
      it "[get_drop_location] responds with [put_player_token] to acceptable user input" do
        skip 
        # input = 3
        # @game.get_drop_location(@new_array, input, @player).must ??? :put_player_token 
      end

      it "[get_drop_location] responds with :full if the column is full" do
        input = 4
        full = @new_array
        0.upto(7) { |i| full[i][3] = 2 }
        @game.get_drop_location(full, input, @player).must_equal :full
      end
      
    end

  end

  describe "Player" do
    
    def setup
      @player = Player.new
    end

  end

  describe "Win" do
    
    def setup
      @win = Win.new
      @new_array = Game.new.new_array
    end
    
    it "responds to 'left_right" do
      @win.must_respond_to :left_right
    end
    
    it "[left_right] throws :winner with matching conditions" do
      left_right_win = @new_array
      1.upto(4) { |i| left_right_win[7][i] = 2 }
      @win.left_right(left_right_win, 2).must_equal :winner
    end
    
    it "[left_right] throws :nothing_yet without matching conditions" do
      left_right_no_win = @new_array
      1.upto(3) { |i| left_right_no_win[7][i] = 2 }
      @win.left_right(left_right_no_win, 2).wont_equal :winner
    end
    
  end

end
