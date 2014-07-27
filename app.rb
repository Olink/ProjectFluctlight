require './PlayerInformation/player_info'
require './Inventory/inventory'
require './Inventory/item'
require './Inventory/item_wrapper'
require './Inventory/recipe'
require './Inventory/material'
require './Inventory/item_store'
require './Inventory/recipe_store'
require './Skills/skill_store'

require 'sequel'

item_store = ItemStore.new(File.join(Dir.pwd, "data", "items"))
item_store.print()

recipe_store = RecipeStore.new(File.join(Dir.pwd, "data", "recipes"))
recipe_store.recipe_store.each{
    |key, value| puts(value.to_string)
}

skill_store = SkillStore.new(File.join(Dir.pwd, "data", "skills"))
skill_store.print()

char = PlayerInfo.new("test")
char.gold = 100

#fetch an item from the item storage....item store is probably a bad name in hindsight
item = item_store.get_item(0, 7)
item2 = item_store.get_item(0, 9)
item3 = item_store.get_item(0, 1)
#add the items to the inventory, and test an invalid slot id
char.inventory.add_item(item)
char.inventory.add_item(item2)
char.inventory.add_item(item3)

recipe = Recipe.new(0, [Material.new(0, 11)], [item2], 0)
puts("Can craft: #{char.inventory.can_craft(recipe)}")

char.print

char.inventory.craft(recipe)

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

DB = Sequel.connect('sqlite://database.db')
require_relative 'models/init'

DB[:users].each {
    |x| puts("Users in db:\n\t" + x[:username])
}