require './PlayerInformation/player_info'
require './Inventory/item'

char = PlayerInfo.new("test")
char.gold = 100

#define two items
item = Item.new("Potion", 100, 50, 1)
item2 = Item.new("Potion", 100, 50, 10)
#add the items to the inventory, and test an invalid slot id
char.inventory.add_item(item)
char.inventory.put_item(4, item2)
char.inventory.put_item(11, item2)


char.print

#consume one from each item, erasing one from the inventory
char.inventory.consume(0)
char.inventory.consume(4)

char.print

#infinite loop
input = ''
begin
  input = gets.chomp
  puts input
end while (input != 'exit')
