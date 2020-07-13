greeting = "Welcome to BATTLESHIP"
puts greeting
puts "Enter 'p' to play or 'q' to quit at any point after you start the game."
print "> "
answer = gets.chomp

if answer == 'p'
  @start = true
elsif answer == 'q'
  puts "Please enter p to play."
end
