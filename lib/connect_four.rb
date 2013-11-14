module ConnectFour
  require_relative 'resources/game'
  
  @game = Game.new 

  puts @game.start
  
  # flag update 'get_players' to accept player names
  @game.get_players

  # begin the game
  round = 1
  player = 1
  # until @game.check === "IT'S OVER" do
     puts "   Round #{round} - FIGHT! \n\n"
     if round == 1
       puts @game.create_grid(@game.new_array, player)
       input = gets.chomp
       @game.get_drop_location(@game.new_array, input, player)
     else
       # puts @game.create_grid()   
     end 
     
     # round += 1
  # end
  

  # finish the game
  
  puts "Congratulations, #{@winner}.  You've won!"
  
end

