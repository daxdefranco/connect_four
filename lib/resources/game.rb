class Game
  require_relative 'instructions'
  
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
  # def get_players
  #   @p1 = 1
  #   @p2 = 2
  # end  

  def name
    "{~~~  Connect Four  ~~~}\n\n"
  end
  
  def column_numbers
    " 1  2  3  4  5  6  7  8\n"
  end  
  
  def player_prompt(player)
    puts "\nPlayer #{player}, select a column to drop your game piece\n\n"
  end
  
  def create_grid(array, player)
    gameboard_head
    array.each do |a|
      puts "#{a} \n"
    #   edit this to include @p1 name
      $current_array = array
    end; ""
  end
  
  def new_array
    Array.new(64, 0).each_slice(8).to_a
  end
  
  def get_drop_location(array, column, player)
    # if check_valid(column) == :check_fail
    #   return :check_fail
    # else  
      column = column.to_i - 1
    # end
    7.downto(0).each do |row|
      if array[row][column.to_i] == 0
        put_player_token(array, row, column, player)
        break
      end
    end
    # this should return full ONLY if the until loop completes without calling
    # `put_player_token` - but i think because that's not a 'return' value, `:full`
    # is ALWAYS being returned.  
    # :full
  end  
  
  def put_player_token(array, row, column, player)
    array[row][column.to_i] = player
    clear
    return create_grid(array, player)
  end

  def check_valid(column)
    column = column.to_i
    if column > 8 || column < 1
      return :check_fail
    end
  end
  
  def check_win(array, player)
    round = []
    round << left_right(array, player)
    round << down_up(array, player)
    round << diagonal_right(array, player)
    round << diagonal_left(array, player)
    if round.include?(:winner)
      return :winner
    end
  end  

  def end_of_game_message(round, player)
    if round == 64
      puts "You're both winners"
    else  
      puts "\nCongratulations, Player #{player}.  You've won!"
    end
  end

  def toggle(player)
    player == 1 ? 2 : 1
  end

  def clear
    puts "\e[H\e[2J"    
  end
  
  def left_right(array, player)
    7.downto(0).each do |row|
      5.times do |column|
        if array[row][column] == player
          if array[row][column + 1] == player && array[row][column + 2] == player && array[row][column + 3] == player
            return :winner
          end   
        end  
      end  
    end
    return :nothing_yet
  end
  
  def down_up(array, player)
    7.downto(3).each do |row|
      8.times do |column|
        if array[row][column] == player
          if array[row - 1][column] == player && array[row - 2][column] == player && array[row - 3][column] == player
            return :winner
          end   
        end  
      end   
    end
    return :nothing_yet
  end
  
  def diagonal_right(array, player)
    7.downto(3).each do |row|
      5.times do |column|
        if array[row][column] == player
          if array[row - 1][column + 1] == player && array[row - 2][column + 2] == player && array[row - 3][column + 3] == player
            return :winner
          end   
        end  
      end  
    end
    return :nothing_yet
  end
  
  def diagonal_left(array, player)
    7.downto(3).each do |cell|
      if array[cell][cell] == player
        if array[cell - 1][cell - 1] == player && array[cell - 2][cell - 2] == player && array[cell - 3][cell - 3] == player
          return :winner
        end   
      end  
    end
    return :nothing_yet
  end

end