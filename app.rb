require './PlayerInformation/player_info'
require './Inventory/item'
require './Inventory/item_wrapper'
require './Inventory/recipe'
require './Inventory/material'
require './Inventory/item_store'
require './Inventory/recipe_store'
require './Skills/skill_store'

item_store = ItemStore.new(File.join(Dir.pwd, "data", "items"))
item_store.print()

recipe_store = RecipeStore.new(File.join(Dir.pwd, "data", "recipes"))
recipe_store.recipe_store.each{
    |key, value| puts(value.to_string)
}

skill_store = SkillStore.new(File.join(Dir.pwd, "data", "skills"))
SkillStore.skill_list.each {
    |key, value| puts(value.to_string)
}

char = PlayerInfo.new("test")
char.gold = 100

#fetch an item from the item storage....item store is probably a bad name in hindsight
item = item_store.get_item(0, 1)
item2 = item_store.get_item(0, 10)
#add the items to the inventory, and test an invalid slot id
char.inventory.add_item(item)
char.inventory.put_item(4, item2)
char.inventory.put_item(11, item2)

recipe = Recipe.new(0, [Material.new(0, 11)], [item2], 0)
puts("Can craft: #{recipe.can_craft(char.inventory)}")

char.print

#consume one from each item, erasing one from the inventory
#char.inventory.consume(0)
#char.inventory.consume(4)

#char.print

#infinite loop
#input = ''
#begin
#  input = gets.chomp
#  puts input
#end while (input != 'exit')
