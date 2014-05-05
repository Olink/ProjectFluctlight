require 'json'

require './Inventory/item'
require './Inventory/recipe'

class RecipeStore
  @recipe_store
  def initialize(root_path)
    @recipe_store = Hash.new
    read_files(root_path)
  end

  def read_files(root_path)
    if(!Dir.exists?(root_path))
      return
    end
    Dir.entries(root_path).each{ |filename|
      if(File.exists?(File.join(root_path, filename)) and File.extname(filename) == '.json')
        contents = ''
        File.open(File.join(root_path, filename), "r") do |f|
          f.each_line do |line|
            contents = contents + line
          end
        end
        json_recipe = JSON.parse(contents)
        json_item = json_recipe['result']
        item = Item.new(json_item['id'], json_item['name'], json_item['price'], json_item['sell'], json_item['stack'])
        recipe = Recipe.new(json_recipe['id'], json_recipe['materials'], item, json_recipe['difficult'])
        @recipe_store[recipe.id] = recipe
      end
    }
  end

  def recipe_store
    return @recipe_store
  end
end
