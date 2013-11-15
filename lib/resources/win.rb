class Win
  
  CONDITIONS = %i[left_right, down_up, diagonal_right, diagonal_left]
  
  def left_right(array, player)
    row = 7
    until row < 0
      column = 0
      #limit column checking for HUGE SPEED BOOST!
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
  
  def down_up(array, player)
    row = 7
    until row < 3
      column = 0
      until column > 7
        if array[row][column] == player
          if array[row - 1][column] == player && array[row - 2][column] == player && array[row - 3][column] == player
            return :winner
          end   
        end  
      column += 1
      end  
    row -= 1  
    end
    return :nothing_yet
  end
  
  def diagonal_right(array, player)
    row = 7
    until row < 3
      column = 0
      until column > 4
        if array[row][column] == player
          if array[row - 1][column + 1] == player && array[row - 2][column + 2] == player && array[row - 3][column + 3] == player
            return :winner
          end   
        end  
      column += 1
      end  
    row -= 1  
    end
    return :nothing_yet
  end
  
  def diagonal_left(array, player)
    row = 7
    until row < 3
      column = 7
      until column < 3
        if array[row][column] == player
          if array[row - 1][column - 1] == player && array[row - 2][column - 2] == player && array[row - 3][column - 3] == player
            return :winner
          end   
        end  
      column -= 1
      end  
    row -= 1  
    end
    return :nothing_yet
  end
  
end  

