require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


game = Game.new
game.start
answer = ""
until answer == 'y' || answer == 'n'
  puts "Do you want to play again? (y/n)"
  print '> '
  answer = gets.chomp.downcase
  if answer == 'y'
    game = Game.new
    game.start
  elsif answer == 'n'
    puts "Thanks for Playing!"
    break
  else
    puts "Try again genious! Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    if answer == 'y'
      game = Game.new
      game.start
    elsif answer == 'n'
      puts "Thanks for Playing!"
      break
    end 
  end
end
