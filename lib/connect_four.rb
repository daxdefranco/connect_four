module ConnectFour
  require_relative 'resources/game'
    
  @game = Game.new 
  puts @game.start
  
  # flag update 'get_players' to accept player names
  # @game.get_players

  # begin the game
  round = 1
  player = 1
  winner = :none
  until  winner == :winner || round == 64 do
    @game.round_indicator(round)
    puts @game.create_grid(@game.new_array, player) if round == 1
    player = 1
    2.times do
      @game.player_prompt(player)
      input = (gets || '').chomp
      @game.get_drop_location($current_array, input, player)
      break if @game.check_win($current_array, player) == :winner
      player = @game.toggle(player)
    end
    round += 1
  end
  
  # finish the game
  @game.end_of_game_message(round, player)
    
end



