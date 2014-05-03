require './PlayerInformation/player_info'
require './Tasks/repeating_task'
puts "hello world"
char = PlayerInfo.new("test")
char.gold = 100
char.print

repeating_task = RepeatingTask.new(lambda {puts('test mehtod invoke\n')}, 5000)

input = ''
begin
  input = gets.chomp
  puts input
end while (input != 'exit')

repeating_task.end