class Game
  require_relative 'instructions'
  require_relative 'player'  
  
  def start
    # puts Instructions on start up
    puts Instructions.new.load
    wheres_the_anykey = gets.chomp
    puts "\e[H\e[2J"
  end
  
  def gameboard_head
    puts name
    puts column_numbers
  end
  
  def get_players
    # refresh
    @p1 = 1
    @p2 = 2
  end  

  def name
    "{~~~  Connect Four  ~~~}\n\n"
  end
  
  def column_numbers
    " 1  2  3  4  5  6  7  8\n"
  end  
  
  def create_grid(array)
    array.each do |a|
      puts "#{a} \n"
    #   edit this to include @p1 name
    end; "\nPlayer 1, select a column to drop your game piece"
  end
  
  def new_array
    Array.new(64, 0).each_slice(8).to_a
  end
  
  def get_drop_location(array, column)
    row = 7
    unless check_valid(column) == 23
      column = column.to_i - 1
    end
    until row < 0
      # column.to_i is for sodding minitest
      if array[row][column.to_i] == 0
        return row
      end
      row -= 1
    end
    return :full
  end  
  
  def put_player_token(array, row, column, player)
    array[row][column] = player
    return array
  end

  def check_valid(column)
    column = column.to_i
    if column > 8 || column < 1
      return 23
    end
  end  

end