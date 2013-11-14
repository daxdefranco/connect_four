class Game
  require_relative 'instructions'
  require_relative 'player'  
  require_relative 'win'
  
  def start
    # puts Instructions on start up
    puts Instructions.new.load
    wheres_the_anykey = gets.chomp
    clear
  end
  
  def gameboard_head
    puts name
    puts column_numbers
  end
  
  # flag update to allow names
  def get_players
    @p1 = 1
    @p2 = 2
  end  

  def name
    "{~~~  Connect Four  ~~~}\n\n"
  end
  
  def column_numbers
    " 1  2  3  4  5  6  7  8\n"
  end  
  
  def create_grid(array, player)
    gameboard_head
    array.each do |a|
      puts "#{a} \n"
    #   edit this to include @p1 name
    end; "\nPlayer #{player}, select a column to drop your game piece"
  end
  
  def new_array
    Array.new(64, 0).each_slice(8).to_a
  end
  
  def get_drop_location(array, column, player)
    row = 7
    unless check_valid(column) == 23
      column = column.to_i - 1
    end
    until row < 0
      if array[row][column.to_i] == 0
        put_player_token(array, row, column, player)
        break
      end
      row -= 1
    end
    return :full
  end  
  
  def put_player_token(array, row, column, player)
    array[row][column.to_i] = player
    player = toggle(player)
    clear
    return create_grid(array, player)
  end

  def check_valid(column)
    column = column.to_i
    if column > 8 || column < 1
      return 23
    end
  end  

  def toggle(player)
    player == 1 ? 2 : 1
  end

  def clear
    puts "\e[H\e[2J"    
  end

end