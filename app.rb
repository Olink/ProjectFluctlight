require './PlayerInformation/player_info'
require './Tasks/repeating_task'
puts "hello world"
char = PlayerInfo.new("test")
char.gold = 100
char.print

repeating_task = RepeatingTask.new(lambda {puts('Test method invoke.\n')}, 5000) # The fuck is this

input = ''
begin
  input = gets.chomp
  puts input
end while (input != 'exit')

repeating_task.end
