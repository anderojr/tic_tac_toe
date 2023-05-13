require_relative 'game'

def play_game
  puts "Let's play Tic Tac Toe!"
  puts ''

  player_one, player_two = setup_players

  puts "Nice to meet you, #{player_one}! You're going to be the X"
  puts "Nice to meet you, #{player_two}! You're going to be the O"

  game = Game.new(player_one, player_two)
  game.play

  repeat_game
end

def setup_players
  puts "What's player one's name?"
  player_one = gets.chomp

  puts "What's player two's name?"
  player_two = gets.chomp

  [player_one, player_two]
end

def repeat_game
  puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
  repeat_input = gets.chomp.downcase
  if repeat_input == 'y'
    play_game
  else
    puts 'Thanks for playing!'
  end
end

play_game
