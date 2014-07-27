require 'json'

require './Inventory/item'
require './Inventory/item_wrapper'

class ItemStore
  @item_store
  def initialize(root_path)
    @item_store = Hash.new
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
        json_item = JSON.parse(contents)
        item = Item.new(json_item['id'], json_item['name'], json_item['price'], json_item['sell'])
        @item_store[item.id] = item
      end
    }
  end

  def get_item(id, count)
    if(@item_store.has_key?(id))
      return ItemWrapper.new(@item_store[id], count)
    end
    return nil
  end

  def print
    @item_store.each{
        |key, value| puts(value.to_string)
    }
  end
end