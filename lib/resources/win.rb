class Win
  
  CONDITIONS = [:left_right, :down_up, :diagonal_one, :diagonal_two]
  
  
  #works if winning row is the bottom row (7)
  def left_right(array, player)
    row = 7
    column = 0
    until row < 0
      until column > 4
        if array[row][column] == player
          if array[row][column + 1] == player && array[row][column + 2] == player && array[row][column + 3] == player
            return :winner
          end   
        end
        column += 1
      end  
      row -= 1  
    end
    return :nothing_yet
  end
  
  def down_up(array)
    #
  end
  
  def diagonal_one(array)
    #
  end
  
  def diagonal_two(array)
    #
  end
  
end  