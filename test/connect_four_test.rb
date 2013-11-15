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
        Digest::MD5.hexdigest(@new_grid.inspect).must_equal "9d4568c009d203ab10e33ea9953a0264"
      end

      it "responds to 'start'" do
        @game.must_respond_to :start
      end

      # it "responds to 'get_players" do
      #   @game.must_respond_to :get_players
      # end
      
    end
    
    # Run #
    
    describe "runtime" do
      
      it "responds to 'new_array'" do
        @game.must_respond_to :new_array
      end

      it "responds to 'check_valid'" do
        @game.must_respond_to :check_valid
      end

      it "[check_valid] returns `check_fail` if invalid" do
        @game.check_valid(99).must_equal :check_fail
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
      
       # LEFT TO RIGHT WIN #

        it "responds to 'left_right" do
          @game.must_respond_to :left_right
        end

        it "[left_right] throws :winner with matching conditions" do
          left_right_win = @new_array
          1.upto(4) { |i| left_right_win[5][i] = 2 }
          @game.left_right(left_right_win, 2).must_equal :winner
        end

        it "[left_right] throws :nothing_yet without matching conditions" do
          left_right_no_win = @new_array
          1.upto(3) { |i| left_right_no_win[5][i] = 2 }
          @game.left_right(left_right_no_win, 2).wont_equal :winner
        end

        # DOWN TO UP WIN #

        it "responds to 'down_up'" do
          @game.must_respond_to :down_up
        end

        it '[down_up] throws :winner with matching conditions' do
          down_up_win = @new_array
          1.upto(4) { |i| down_up_win[i][3] = 2}
          @game.down_up(down_up_win, 2).must_equal :winner
        end

        it "[down_up] throws :nothing_yet without matching conditions" do
          down_up_no_win = @new_array
          1.upto(3) { |i| down_up_no_win[i][3] = 2}
          @game.down_up(down_up_no_win, 2).wont_equal :winner
        end

        # DIAGONAL RIGHT WIN #

        it "responds to diagonal_right" do
          @game.must_respond_to :diagonal_right
        end

        it "[diagonal_right] throws :winner with matching conditions" do
          diagonal_right_win = @new_array
          0.upto(3) { |i| diagonal_right_win[6-i][1+i] = 2}
          @game.diagonal_right(diagonal_right_win, 2).must_equal :winner
        end

        it "[diagonal_right] throws :nothing_yet without matching conditions" do
          diagonal_right_no_win = @new_array
          0.upto(2) { |i| diagonal_right_no_win[6-i][1+i] = 2}
          @game.diagonal_right(diagonal_right_no_win, 2).must_equal :nothing_yet
        end

        #DIAGONAL LEFT WIN # 

        it "responds to diagonal_left" do
          @game.must_respond_to :diagonal_left
        end

        it "[diagonal_left] throws :winner with matching conditions" do
          diagonal_left_win = @new_array
          0.upto(3) { |i| diagonal_left_win[6-i][7-i] = 2}
          @game.diagonal_left(diagonal_left_win, 2).must_equal :winner
        end

        it "[diagonal_left] throws :nothing_yet without matching conditions" do
          diagonal_left_no_win = @new_array
          0.upto(2) { |i| diagonal_left_no_win[6-i][7-i] = 2}
          @game.diagonal_left(diagonal_left_no_win, 2).must_equal :nothing_yet
        end
      
    end

  end

  describe "CONNECT FOUR" do
    
    def setup
      #relax, nsa
      @c4 = ConnectFour
      @game = Game.new
    end

    # it "starts the game with an empty grid" do
    #   proc {@c4.start }.must_output @game.start
    # end
    
  end

end
