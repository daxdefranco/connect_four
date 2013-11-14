module ConnectFour
  require_relative 'resources/game'
  
  @game = Game.new 

  puts @game.start
  
  # update 'get_players' to accept player names
  @game.get_players


  # begin the game
  round = 1
  # until @game.check === "IT'S OVER" do
     puts "Round #{round}. FIGHT! \n"
     puts @game.gameboard_head
     if round == 1
       puts @game.create_grid(@game.new_array)
     else
       # puts @game.create_grid()   
     end 
     player = 1
     input = gets.chomp
     puts @game.get_drop_location(@game.new_array, input)
     # round += 1
  # end
  

  # finish the game
  
  puts "Congratulations, #{@winner}.  You've won!"
  
end

